class FixFeeColumnDataTypeToFaclityAndEvent < ActiveRecord::Migration[7.1]
  def change
    change_column :facilities, :fee, :text

    change_column :events, :fee, :text
  end
end
