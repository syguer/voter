class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :url
      t.integer :count

      t.timestamps
    end
  end
end
