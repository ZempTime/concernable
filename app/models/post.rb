class Post < ApplicationRecord
  include Orderable

  has_many :nested_items, class_name: "Post", foreign_key: "bucket_id", foreign_type: "bucket"
  belongs_to :bucket, polymorphic: true, required: false

  scope :not_nested, -> { where(bucket_id: nil, bucket_type: nil) }

  def file(post)
    post.update(bucket: self, position: next_position)
  end

  def next_position
    latest_position = nested_items&.pluck(:position)&.max || 0
    latest_position + 1
  end
end
