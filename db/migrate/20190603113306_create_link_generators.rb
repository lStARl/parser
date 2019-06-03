class CreateLinkGenerators < ActiveRecord::Migration[5.2]
  def change
    create_table :link_generators do |t|

      t.timestamps
    end
  end
end
