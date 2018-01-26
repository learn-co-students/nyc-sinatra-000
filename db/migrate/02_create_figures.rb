class CreateFigures < ActiveRecord::Migration[4.2]
  def change
    create_table :figures do |f|
      f.string :name
    end
  end
end
