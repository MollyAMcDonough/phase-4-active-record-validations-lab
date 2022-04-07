class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :sufficiently_clickbaity

    def sufficiently_clickbaity
        if title
            unless ["won't believe", "secret", "top", "guess"].any? {|cb| title.downcase.include?(cb)}
                errors.add(:title, "not clickbaity enough")
            end
        end
    end

end
