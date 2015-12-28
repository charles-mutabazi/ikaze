class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongo::Voteable
  # include MongoidVote::Voteable

  field :content

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
