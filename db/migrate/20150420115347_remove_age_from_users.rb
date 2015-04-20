class RemoveAgeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :age, :number
  end
end
