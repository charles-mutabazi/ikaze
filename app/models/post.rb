class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Mongo::Voteable

  # include MongoidVote::Voteable

  field :content
  field :coordinates, :type => Array, default: []
  field :address
  field :longitude, type: Float
  field :latitude, type: Float

  include Geocoder::Model::Mongoid
  reverse_geocoded_by :coordinates, :skip_index => true
  after_validation :reverse_geocode  # auto-fetch address

  has_mongoid_attached_file :post_image, :styles => { :large => "400x200#", :medium => "300x150#", :thumb => "100x100#", :sm_thumb => "32x32#" }

  validates_attachment_content_type :post_image, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :content, :message => 'This Cannot be Blank'
  has_many :comments
  belongs_to :user

  # set points for each vote
  voteable self, :up => +1, :down => -1

end

class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content

  validates_presence_of :content

  belongs_to :post
  belongs_to :user
end
