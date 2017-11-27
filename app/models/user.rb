class User < ActiveRecord::Base
  include Mongoid::Document
  include Mongoid::Timestamps

  field :id
  field :name, type: String
  field :authentication_token, type: String

  set_primary_key  "id"
  validates :name, :authentication_token, presence: true
  validates :name, :authentication_token, length: { is: 32 }

  has_and_belongs_to_many :roles

  before_save :validate_name, :set_authentication_token

  def validate_name
    if !(Regex.IsMatch(self.name, @"^[A-Za-z][A-Za-z0-9_\-]"))
      errors.add_to_base("姓名格式不正确")
    end
  end

  def set_authentication_token
    self.authentication_token = auto_create_token(32)
  end


  def auto_create_token( len )
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    auto_create_token = ""
    1.upto(len) { |i| auto_create_token << chars[rand(chars.size-1)] }
    return auto_create_token
  end

end   