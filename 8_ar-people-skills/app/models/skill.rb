class Skill < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :proficiencies
  has_many :users, :through => :proficiencies

  def user_with_proficiency(level)
    prof = self.proficiencies.find { |prof| prof.level == level }
    prof ? prof.user : nil
  end
end
