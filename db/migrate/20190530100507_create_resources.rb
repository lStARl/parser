class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.date :published_date
      t.string :rubygem
      t.string :title
      t.string :cve

      t.timestamps
    end
  end
end
