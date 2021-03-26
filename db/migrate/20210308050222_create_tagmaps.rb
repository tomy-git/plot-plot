class CreateTagmaps < ActiveRecord::Migration[5.2]
  def change
    create_table :tagmaps do |t|
      t.integer :plot_id, foreign_key: true
      t.integer :tag_id, foreign_key: true
      t.index [:plot_id, :tag_id], unique: true
      
      t.timestamps
    end
  end
end
