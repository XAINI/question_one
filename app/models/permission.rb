class Permission < ActiveRecord::Base
  include Mongoid::Document
  include Mongoid::Timestamps

  field :id
  field :operation, type: String

  belongs_to :roles

end   