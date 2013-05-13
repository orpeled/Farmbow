class StaticPagesController < ApplicationController


  def home

    # get user id - there must be a better way.
    if user_signed_in?
      #@plant = nil
      @user_actions = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user, owner_type: "User").page(params[:page]).per_page(5)
      # getting current user
      user = current_user

      # refresh every 10 seconds.
      if Time.now - user.updated_at > 10.minutes

        if user.location.nil?
          puts 'please modify your location !'
        else

          # Modifying what's stored in the database so it'll comply with search terms
          location_full = (user.location == 'Tel Aviv' ? 'Tel Aviv, Israel' : 'Tampa, Florida')

          # New barometer to measure temperature.

          barometer = Barometer.new(location_full)
          Barometer.timeout=1000
          weather = barometer.measure
          current_temp = weather.current.temperature.fahrenheit

          # Save it as a user's attribute.
          user.current_temperature= current_temp
          user.save!
        end

      end

      #@plant = nil

      #Lets update the progress bar.
      if Plant.any?
        current_user.plants.each do |this_plant|

          # Should we update bar? (checking if we didn't do so yet)
          time_diff = (Date.today - this_plant.irrigation_level_updated_at.to_date).to_i

          if time_diff >= 1
            should_water_every = this_plant.irrigation_frequency.nil? ? 1 : this_plant.irrigation_frequency
            each_day_equals_percentage = 100 / should_water_every
            result_of_decreasing = this_plant.irrigation_level - (each_day_equals_percentage * time_diff)
            if result_of_decreasing < 0.0
              result_of_decreasing = 0
            end
            this_plant.irrigation_level= result_of_decreasing
            this_plant.irrigation_level_updated_at= DateTime.now
            this_plant.save!

          end


        end
        @plant = current_user.plants.first
      end




    end
  end




  def about
  end

  def contact
  end

end

