class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.references :miner, null: false
      t.string :magic_number, null: false, default: '0xD9B4BEF9'
      t.integer :version, null: false
      t.string :hash_curr_block, null: false
      t.string :hash_prev_block, null: false
      t.float :rewarded_transaction_fee, default: 0
      t.integer :rewarded_bitcoins, default: 25
      t.datetime :mined_at
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
