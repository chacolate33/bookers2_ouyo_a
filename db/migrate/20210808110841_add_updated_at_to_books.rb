class AddUpdatedAtToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :updated_at, :datetime
  end
end
