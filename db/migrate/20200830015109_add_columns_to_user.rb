class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :social_name, :string
    add_column :users, :birth_date, :date
    add_column :users, :occupation, :string
    add_column :users, :department, :string
    add_column :users, :company_name, :string
  end
end
