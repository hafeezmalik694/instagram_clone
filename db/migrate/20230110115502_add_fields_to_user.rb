class AddFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :full_name, :string
    add_column :users, :is_private, :boolean, default: true
  end
end
