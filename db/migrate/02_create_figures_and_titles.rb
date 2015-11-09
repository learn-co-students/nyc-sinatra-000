class CreateFiguresAndTitles < ActiveRecord::Migration
  def change
  	create_table :figures do |t|
  	  t.string :name
  	end

  	create_table :titles do |t|
  	  t.string :name
  	end

  	create_table :figures_titles do |t|
  	  t.belongs_to :figure
  	  t.belongs_to :title
  	end
  end
end