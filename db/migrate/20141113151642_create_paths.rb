class CreatePaths < ActiveRecord::Migration
  def change
    drop_table :paths

    create_table :paths do |t|
      t.string :path
      t.string :file_name

      t.timestamps
    end
  end
end
