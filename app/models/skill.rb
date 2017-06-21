class Skill < ApplicationRecord
  include Placeholder
  validates_presence_of :title
  
  after_initialize :set_defaults
  
  def set_defaults
    self.badge ||= Placeholder.image_generator(height: '250', width: '250')
    self.percent_utilized ||= 50
  end
end
