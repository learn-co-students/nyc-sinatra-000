class Figure <ActiveRecord::Base
  has_and_belongs_to_many :titles
  has_many :landmarks 
end