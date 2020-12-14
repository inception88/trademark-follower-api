class CreateTrademarks < ActiveRecord::Migration[5.2]
  def change
    create_table :trademarks do |t|
      t.string :title
      t.integer :serial

      t.timestamps
    end
  end
end
