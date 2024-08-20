class AddAgeRangeToFacilitiesAndEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :facilities, :min_age, :integer
    add_column :facilities, :max_age, :integer

    add_column :events, :min_age, :integer
    add_column :events, :max_age, :integer

    # 既存のデータを更新
    Facility.find_each do |facility|
      if facility.target_age.present?
        ages = facility.target_age.scan(/\d+/).map(&:to_i)
        facility.update(min_age: ages.min, max_age: ages.max)
      end
    end

    Event.find_each do |event|
      if event.target_age.present?
        ages = event.target_age.scan(/\d+/).map(&:to_i)
        event.update(min_age: ages.min, max_age: ages.max)
      end
    end
  end
end
