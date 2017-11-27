class Role < ActiveRecord::Base
  include Mongoid::Document
  include Mongoid::Timestamps

  field :id
  field :name, type: String

  set_primary_key  "id"
  validates :name, presence: true
  validates :name, length: { is: 32 }
  
  has_and_belongs_to_many :users
  has_many :permissions

end   