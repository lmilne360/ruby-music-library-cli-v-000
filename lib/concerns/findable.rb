module Concerns
  module Findable
    def find_by_name(name)
  		self.all.detect {|o| o.name == name}
  	end

  	def find_or_create_by_name(name)
  		self.find_by_name(name) || self.create(name)
  	end

    def create(name)
			o = self.new(name)
			o.save
		end

		def destroy_all
			self.all.clear
		end
  end

  module InstanceMethods
    def save
			self.class.all << self
			self
		end
  end
end
