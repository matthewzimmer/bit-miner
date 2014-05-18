class CreateStatSheets < ActiveRecord::Migration
  def change
    create_table :stat_sheets do |t|
	    t.references :miner, null: false
      t.integer :blocks_mined, default: 0
      t.float :time_between_blocks, default: 0
      t.integer :bitcoins_mined, default: 0
      t.float :total_transaction_fees, default: 0
      t.integer :number_of_transactions, default: 0

	    t.datetime :deleted_at
      t.timestamps
    end
  end
end
