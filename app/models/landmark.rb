class Landmark <ActiveRecord::Base
  #include Slugifiable::InstanceMethods

  belongs_to :figure
end
