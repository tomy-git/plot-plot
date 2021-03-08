class CreatePlots < ActiveRecord::Migration[5.2]
  def change
    create_table :plots do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
