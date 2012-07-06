module Refinery
  module Properties
    class Property < Refinery::Core::BaseModel
      self.table_name = 'refinery_properties'

      attr_accessible :lot_number, :headline, :description, :potential_uses,
        :position, :total_price, :availability_status, :land_area_sqm,
        :street_address, :latitude, :longitude

      acts_as_indexed :fields => [:lot_number, :headline, :description, :potential_uses]

      validates :lot_number, :presence => true, :uniqueness => true

      has_many_page_images

      def lot_name
        "Lot #{lot_number}"
      end

      def latlng
        [latitude, longitude] if latitude && longitude
      end
    end
  end
end
