class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :large => "600x", :medium => "200x>", :thumb => "100x100>" },:default_url => "thumb-default.gif"
	else
		has_attached_file :image, :styles => { :large => "600x", :medium => "200x>", :thumb => "100x100>" },:default_url => "thumb-default.gif",
					  :storage => :dropbox,
					  :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
					  :path => ":style/:id_:filename"
						
		
	end

	validates :name, :description, :price, presence: true
	validates :price, numericality: {greater_than: 0}
	validates_attachment_presence :image
	validates_attachment :image, :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] }


	belongs_to :user    
end
