class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.string :index
      t.string :file_name

      t.timestamps
    end
  end
end
