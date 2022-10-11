class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :fullname, :string
  end
end
