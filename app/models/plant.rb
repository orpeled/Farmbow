# == Schema Information
#
# Table name: plants
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  type                 :string(255)
#  initial_plant_info   :text
#  irrigation_quantity  :float
#  irrigation_frequency :integer
#  irrigation_level     :float
#  irrigation_info      :text
#  fertilizer_quantity  :float
#  fertilizer_frequency :integer
#  temperature_info     :text
#  safe_temp_min        :float
#  safe_temp_max        :float
#  sun_level            :float
#  sun_info             :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
#type:string - The plant type e.g Tomato
#initial_plant_info:text - Initial plant description
#
#irrigation_quantity:real - How much water does the plant need on each irrigation
#irrigation_frequency:integer - How often should one irrigate (days)
#irrigation_level:real - How much water does this plant have right now.
#                                                                      irrigation_info:text - A description regarding how to irrigate this plant
#
#fertilizer_quantity:real - How much fertilizer should be used.
#                                                             fertilizer_frequency:integer - How often should one fertilize (days)
#
#temperature_info:text - This plant best practices temperature wise
#safe_temp_min:real - How low can the temperature be
#safe_temp_max:real - How low can the temperature be
#
#sun_level:real - How much sun does this plant get
#sun_info:text - A description regarding how to treat the plant sun wise
#




class Plant < ActiveRecord::Base

  attr_accessible :fertilizer_frequency, :fertilizer_quantity, :initial_plant_info, :irrigation_frequency, :irrigation_info, :irrigation_level, :irrigation_quantity, :name, :safe_temp_max, :safe_temp_min, :sun_info, :sun_level, :temperature_info, :type
end
