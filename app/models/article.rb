class Article < ApplicationRecord
    scope :hellos, -> { where(title: "hello") }
end
