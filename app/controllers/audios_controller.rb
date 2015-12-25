class AudiosController < ApplicationController
  def index
    @audios = Audio.all
  end

  def new
    @audio = Audio.new
  end

  def create
    if Audio.create(audio_params).errors.any?
      redirect_to :back
    else
      redirect_to audios_path
    end
  end

  def download
    audio = Audio.find(params[:id])
    send_file audio.audio_file.path,
              filename: audio.audio_file_file_name,
              type: audio.audio_file_content_type,
              disposition: 'attachment'
  end

  protected

  def audio_params
    params[:audio].permit!
  end
end
