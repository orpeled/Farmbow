# == Schema Information
#
# Table name: contact_messages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  subject    :string(255)
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContactMessage < ActiveRecord::Base
  attr_accessible :name, :email, :subject, :body

  validates :name, :email, :subject, :body, :presence => true
  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => true

  def persisted?
    false
  end
end
