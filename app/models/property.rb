class Property < ApplicationRecord
  has_many :nearest_stations
  validates_associated :nearest_stations
  with_options presence: true do
    validates :name
    validates :rent
    validates :address
    validates :age
  end
  accepts_nested_attributes_for :nearest_stations,
                                reject_if: :reject_nearest_stations,
                                allow_destroy: true

  def reject_nearest_stations(attributes)
    exists = attributes[:id].present?
    empty = attributes[:line].blank? and attributes[:station].blank? and attributes[:time].blank?
    attributes.merge!(_destroy: 1) if exists && empty
    !exists && empty
  end
end
