class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :proficiencies
  has_many :skills, :through => :proficiencies
  #has_and_belongs_to_many :skills

  def proficiency_for(skill)
    prof = self.proficiencies.find { |prof| prof.skill == skill }
    prof ? prof.level : nil
  end

  def set_proficiency_for(skill, level)
    prof = self.proficiencies.find { |prof| prof.skill == skill }
    if prof
      prof.level = level
      prof.save
    end
  end
end
