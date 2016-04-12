class Article < ActiveRecord::Base
  validates :title, :url, :image_url, presence: true
  validates :url, :image_url, format: { with: /https?:\/\// }
  
  # mb bad idea to compare strings
  def self.save_from_hashes(array)
    array.each do |obj|
      Article.create(obj) unless Article.exists?(url: obj[:url])
    end
  end
end
