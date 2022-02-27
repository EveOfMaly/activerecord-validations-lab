class Post < ActiveRecord::Base
        validates :title, presence: true
        validates :content, length: { minimum: 250 }
        validates :summary, length: { maximum: 250 }
        validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
        validate :clickbait


        def is_clickbait?
            if blacklist.include?(:title) 
                errors.add(:title, "can't be a clickbate word")
            end
        end


        def blacklist 
            ["/Won't Believe/", "/Secret/", "/Top [number]", "/Guess/"]
        end

end


