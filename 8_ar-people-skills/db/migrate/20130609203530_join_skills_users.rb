class JoinSkillsUsers < ActiveRecord::Migration
  def change
    create_table :proficiencies do |t|
      t.references :skill
      t.references :user
      t.integer :level, :default => 0
    end
  end
end
