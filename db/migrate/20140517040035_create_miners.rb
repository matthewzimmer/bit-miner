class CreateMiners < ActiveRecord::Migration
  def change
    create_table :miners do |t|
      t.string :email, null: false

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
