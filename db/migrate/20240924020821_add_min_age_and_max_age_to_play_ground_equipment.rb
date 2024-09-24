class AddMinAgeAndMaxAgeToPlayGroundEquipment < ActiveRecord::Migration[7.1]
  def up
    add_column :playground_equipments, :min_age, :integer unless column_exists?(:playground_equipments, :min_age)
    add_column :playground_equipments, :max_age, :integer unless column_exists?(:playground_equipments, :max_age)

    PlaygroundEquipment.find_each do |pe|
      if pe.target_age.present?
        ages = pe.target_age.scan(/\d+/).map(&:to_i)
        pe.update(min_age: ages.min, max_age: ages.max)
      end
    end

  end

  def down
    remove_column :playground_equipments, :min_age if column_exists?(:playground_equipments, :min_age)
    remove_column :playground_equipments, :max_age if column_exists?(:playground_equipments, :max_age)
  end
end
