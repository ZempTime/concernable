class AddBucketableToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :bucket_id, :integer
    add_column :posts, :bucket_type, :string
  end
end
