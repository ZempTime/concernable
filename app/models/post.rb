class Post < ApplicationRecord
  include Orderable

  has_many :nested_items, class_name: "Post", foreign_key: "bucket_id", foreign_type: "bucket"
  belongs_to :bucket, polymorphic: true, required: false

  scope :not_nested, -> { where(bucket_id: nil, bucket_type: nil) }
end
