class Landmark <ActiveRecord::Base
	belongs_to :figure

	def slug
		self.name.downcase.split.join('-')
	end

	def self.find_by_slug(slug)
		names = slug.split('-')
		names.collect! { |name| name.capitalize }
		name = names.join(' ')
		result = self.all.select do |item| 
			item.name.downcase == name.downcase
		end
		result[0]
	end

	def self.find_by_name(name)
		result = self.all.select do |item| 
			item.name.downcase == name.downcase
		end
		result[0]
	end

end
