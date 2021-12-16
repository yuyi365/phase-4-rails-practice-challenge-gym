class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.integer :charge
      t.integer :gym_id
      t.integer :client_id
      t.timestamps
    end
  end
end
