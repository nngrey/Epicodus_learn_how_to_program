class CreateChangeContentDataType < ActiveRecord::Migration
  def change
    remove_column :lessons, :content
    add_column :lessons, :content, :text
  end
end
