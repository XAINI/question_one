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

  before_save :validate_name

  def validate_name
    if !(Regex.IsMatch(self.name, @"^[A-Za-z][A-Za-z0-9_\-]"))
      
    end
  end



  

end   