class Profile < ActiveRecord::Base
   mount_uploader :picture, PictureUploader
   attr_accessible :nim, :bio, :first_name, :last_name, :picture, :user_id

   validates_presence_of :nim, :first_name, :last_name, :message => "Field harus di isi"

   belongs_to :user

   
end
