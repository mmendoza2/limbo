class Micrositio < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true
  validates :introtext, presence: true
  has_attached_file :photo, :styles => {:biggest => "900x900>", :big => "610x610>", :medium => "500x500>", :small => "250x250>", :smallest =>"100x100>" },
                    :url  => ":s3_domain_url",
                    :path => "/:class/:attachment/:id_partition/:style/:filename"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 20.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']


  extend FriendlyId
  friendly_id :name, use: :slugged


end
