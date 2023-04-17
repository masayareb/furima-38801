class Address < ApplicationRecord
  belongs_to :order

  #ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
