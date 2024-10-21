class AddAdultAndChildFeeToFacilitiesAndEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :facilities, :adult_fee, :integer
    add_column :facilities, :child_fee, :integer

    add_column :events, :adult_fee, :integer
    add_column :events, :child_fee, :integer
  end
end
