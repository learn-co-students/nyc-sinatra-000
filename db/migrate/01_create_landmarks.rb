class CreateLandmarks < ActiveRecord::Migration
	def change
	  create_table :landmarks do |t|
  		t.belongs_to :figure
    	t.string   :name
	    t.integer  :year_completed
  	  t.datetime :created_at
    	t.datetime :updated_at
	  end
	end
end
