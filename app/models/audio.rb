class Audio < ActiveRecord::Base
  has_attached_file :audio_file,
    :storage => :s3,
    :path => "audio_files/:id/:filename"

  validates_attachment_content_type :audio_file, :content_type => /.*/
end
