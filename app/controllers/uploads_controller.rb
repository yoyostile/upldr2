class UploadsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  before_action :set_upload, only: [:show, :destroy]
  http_basic_authenticate_with \
    name: Rails.application.config.http_basic_auth_user,
    password: Rails.application.config.http_basic_auth_password,
    only: :index

  def index
    @uploads = Upload.all
  end

  def new
    @upload = Upload.new
  end

  def show
    if @upload
      version = @upload.file.versions.include?(params[:version]&.to_sym) ? params[:version] : nil
      file = version.present? ? @upload.file.send(version).file.file : @upload.file.file.file #lol
      send_file file, disposition: :inline
    else
      redirect_to root_path
    end
  end

  def create
    @upload = Upload.new upload_params
    @album = Album.find_by_slug (params[:upload] || {})[:album_slug]
    @upload.album = @album if @album
    if @upload.save
      render json: { status: 'success', url: url_for(controller: :uploads, action: :show, id: @upload) }
    else
      render json: { status: 'failed', message: 'unprocessable_entity' }
    end
  end

  def destroy
    @upload.destroy
    redirect_to uploads_path
  end

  private

  def set_upload
    @upload = Upload.find_by_token(params[:id])
  end

  def upload_params
    {
      file: params[:file],
      ip: request.remote_ip
    }
  end
end
