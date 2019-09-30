class AddDateToRates < ActiveRecord::Migration[6.0]
  def change
    add_column :rates, :fixed_till, :datetime
  end
end
