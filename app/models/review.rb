class Review < ActiveRecord::Base
    acts_as_gmappable :lng => "lng", :lat => "lat"
    
    def gmaps4rails_address
        "#{self.city}, #{self.country}"
    end

    is_impressionable
    belongs_to :user
    mount_uploader :image, ReviewImagesUploader
    has_many :ratings, dependent: :destroy
    has_many :comments, dependent: :destroy
    serialize :category
    default_scope -> { order('created_at DESC') }
    validates :user_id, presence: true
    validates :summary, presence: true, length: { maximum: 230 }
    validates :content, presence: true
    validates :postcode, presence: true
    validates :days, presence: true, numericality: { :greater_than_or_equal_to => 1}
    validates :season, presence: true
    validates :budget, presence: true, numericality: { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 3 }
    validates :category, presence: true
    CATEGORIES = ['Solo', 'Backpacker', 'Romantic', 'Family', 'Senior', 'Business', 'Disabled', 'Group']

    def self.search(days, city, season, content)
    where("days like ? AND location_search like ? AND season like ? AND content like ?", "%#{days}%", "%#{city}", "%#{season}%", "%#{content}%")
    end
    def self.search_budget(budget)
    case budget
        when 1
            where("budget like 1")
        when 3
            where("budget like 1 OR budget like 2")
        when 5
            where("budget like 1 OR budget like 3")
        when 2
            where("budget like 2")
        when 6
            where("budget like 2 OR budget like 3")
        when 4
            where("budget like 3")
        when 7
            where("budget like 1 OR budget like 2 OR budget like 3")
        else
            where("budget like ?", "%#{budget}%")
    end
    end
def average_rating
    ratings.average(:score)
end
    def self.search_timestamp(timetag)
    case timetag
        when "Past week"
            where("created_at > ?", Date.today - 7)
        when "Past month"
            where("created_at > ?", Date.today - 31)
        when "Past year"
                    where("created_at > ?", Date.today - 365)
        else
        where("created_at > ?", Date.new(y=1999))
    end
end
    def self.search_category(scategory)
        where("category like ?", "%#{scategory}%\n")
    end
end
