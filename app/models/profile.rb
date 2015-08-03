class Profile < ActiveRecord::Base
  before_create :generate_fake_name

  belongs_to :pack
  has_many :scalers, class_name: "ProfileScaler"
  has_many :quotes, class_name: "ProfileQuote"
  has_many :basic_repeatables, class_name: "ProfileBasicRepeatable"
  has_many :characteristic_repeatables, class_name: "ProfileCharacteristicRepeatable"

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ""
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  accepts_nested_attributes_for :scalers, allow_destroy: true
  accepts_nested_attributes_for :quotes, allow_destroy: true
  accepts_nested_attributes_for :basic_repeatables, allow_destroy: true
  accepts_nested_attributes_for :characteristic_repeatables, allow_destroy: true

  def generate_fake_name
    if self.generate_name?
      self.name = FFaker::Name.name
    else
      # If generate_name is false but name is empty generate anyway.
      self.name = self.name != "" ? self.name : FFaker::Name.name
    end
  end
end
