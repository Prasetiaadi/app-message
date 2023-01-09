class AddColumnEmailToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :email, :string
  end
end
