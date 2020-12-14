class UpdateTrademarkModel < ActiveRecord::Migration[5.2]
  def change
    change_table :trademarks do |t|
      t.rename :title, :mark
      t.string :status
      t.string :prosecutionHistory
      t.date :statusDate
      t.date :filingDate
      t.rename :serial, :serialNumber
      t.integer :registrationNumber
    end
  end
end