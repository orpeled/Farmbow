#Plant

#type_of_plant:string - The plant type e.g Tomato
#initial_plant_info:text - Initial plant description

#irrigation_quantity:real - How much water does the plant need on each irrigation
#irrigation_frequency:integer - How often should one irrigate (days)
#irrigation_level:real - How much water does this plant have right now.
#irrigation_info:text - A description regarding how to irrigate this plant

#fertilizer_quantity:real - How much fertilizer should be used.
#fertilizer_frequency:integer - How often should one fertilize (days)

#temperature_info:text - This plant best practices temperature wise
#safe_temp_min:real - How low can the temperature be
#safe_temp_max:real - How low can the temperature be

#sun_level:real - How much sun does this plant get
#sun_info:text - A description regarding how to treat the plant sun wise

class Plant < ActiveRecord::Base

  mount_uploader :image, FileUploader

  attr_accessible :fertilizer_frequency, :fertilizer_quantity,
                  :initial_plant_info, :irrigation_frequency, :irrigation_info,
                  :irrigation_level, :irrigation_quantity, :name, :safe_temp_max,
                  :safe_temp_min, :sun_info, :sun_level, :temperature_info, :type_of_plant,
                  :irrigation_level_updated_at, :image

  belongs_to :user
  include PublicActivity::Model
  tracked except: :update, owner: ->(controller, model) { controller && controller.current_user }


end
