class UsersRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :users_roles do |t|
      t.references :user, null: false
      t.references :role, null: false
    end
  end
end
