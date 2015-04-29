class CreateCollectionUsers < ActiveRecord::Migration
  def change
    create_table :collection_users do |t|
      t.integer :collection_id, :user_id
    end
  end
end
