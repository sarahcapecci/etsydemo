class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :large => "600x", :medium => "200x>", :thumb => "100x100>" },:default_url => "thumb-default.gif"
	else
		has_attached_file :image, :styles => { :large => "600x", :medium => "200x>", :thumb => "100x100>" },:default_url => "thumb-default.gif",
					  :storage => :dropbox,
					  :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
					  :path => ":style/:id_:filename"
						
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	end
	    
end
