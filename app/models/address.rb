class Address < ActiveRecord::Base
  has_attached_file :photo,
                    :url => "photos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/photos/:id/:style/:basename.:extension"
  has_one :province
end
