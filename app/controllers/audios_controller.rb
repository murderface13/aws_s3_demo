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
    # redirect_to audio.audio_file.url

    redirect_to(audio.audio_file.expiring_url(10))

    # data = open(audio.audio_file.url)
    # send_data(
    #   data.read,
    #   filename: audio.audio_file_file_name,
    #   type: audio.audio_file_content_type,
    #   disposition: 'inline',
    #   stream: 'true',
    #   buffer_size: '4096'
    # )

  end

  protected

  def audio_params
    params[:audio].permit!
  end
end
