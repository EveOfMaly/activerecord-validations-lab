class Post < ActiveRecord::Base
        validates :title, presence: true
        validates :content, length: { minimum: 250 }
        validates :summary, length: { maximum: 250 }
        validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
        validate :clickbait


        def is_clickbait?
            clickbate = ["Won't Believe", "Secret", "Top [number]", "Guess"]

            if clickbate.include?(:title)
                errors.add(:title, "can't be a clickbate word")
            end
        end

end


