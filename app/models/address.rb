class Address < ApplicationRecord
  belongs_to :order
  belongs_to :prefecture

  #ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
