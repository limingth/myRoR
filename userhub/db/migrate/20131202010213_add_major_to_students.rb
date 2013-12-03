class AddMajorToStudents < ActiveRecord::Migration
  def change
    add_column :students, :major, :string
  end
end
