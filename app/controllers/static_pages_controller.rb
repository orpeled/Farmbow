class StaticPagesController < ApplicationController


  def home

    # get user id - there must be a better way.
    if user_signed_in?

      # getting current user
      user = current_user

      # refresh every 10 seconds.
      if Time.now - user.updated_at > 4.minutes

        if user.location.nil?
          puts 'please modify your location !'
        else

          # Modifying what's stored in the database so it'll comply with search terms
          location_full = (user.location == 'Tel Aviv' ? 'Tel Aviv, Israel' : 'Tampa, Florida')

          # New barometer to measure temperature.
          barometer = Barometer.new(location_full)
          weather = barometer.measure
          current_temp = weather.current.temperature.fahrenheit

          # Save it as a user's attribute.
          user.current_temperature= current_temp
          user.save!
        end

      end

      #Lets update the progress bar.
       Plant.find_all_by_user_id(current_user.id).each do |plant|

        # Should we update bar? (checking if we didn't do so yet)
        time_diff = (Date.today - plant.irrigation_level_updated_at.to_date).to_i

        if time_diff >= 1
          should_water_every = plant.irrigation_frequency.nil? ? 1 : plant.irrigation_frequency
          each_day_equals_percentage = 100 / should_water_every
          result_of_decreasing = plant.irrigation_level - (each_day_equals_percentage * time_diff)
          if result_of_decreasing < 0.0
            result_of_decreasing = 0
          end
          plant.irrigation_level= result_of_decreasing
          plant.irrigation_level_updated_at= DateTime.now
          plant.save!

        end

      end

    end
  end




  def about
  end

  def contact
  end

end

