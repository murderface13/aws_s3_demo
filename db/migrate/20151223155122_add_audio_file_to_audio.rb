class AddAudioFileToAudio < ActiveRecord::Migration
  def self.up
    add_attachment :audios, :audio_file
  end

  def self.down
    remove_attachment :audios, :audio_file
  end
end
