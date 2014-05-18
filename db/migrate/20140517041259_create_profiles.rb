class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
	    t.references :miner
      t.string :nickname, null: false
      t.text :public_key, null: false, length: 512
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :bio, default: ''
      t.integer :reputation, default: 0
      t.boolean :is_public, default: false

      t.datetime :deleted_at
      t.timestamps
    end

    add_attachment :profiles, :avatar
  end
end
