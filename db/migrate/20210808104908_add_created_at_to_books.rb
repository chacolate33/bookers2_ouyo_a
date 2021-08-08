class AddCreatedAtToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :created_at, :datetime
  end
end
