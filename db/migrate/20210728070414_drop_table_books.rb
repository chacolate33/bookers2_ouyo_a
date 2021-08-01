class DropTableBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :boos do |t|
    drop_table :books
  end
end
