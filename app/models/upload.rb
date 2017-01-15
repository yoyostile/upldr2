class Upload < ActiveRecord::Base
  mount_uploader :file, FileUploader
  validates_uniqueness_of :token
  after_initialize :generate_token, unless: :token?

  belongs_to :album

  def to_param
    token
  end

  def image?
    file.content_type.start_with? 'image'
  end

  private

  def generate_token
    self.token = Token.new.to_s
  end
end
