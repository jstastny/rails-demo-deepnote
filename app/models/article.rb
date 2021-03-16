class Article < ApplicationRecord
    scope :hellos, -> { where(title: "hello") }
    scope :deepnotes, -> { where(title: "deepnote") }
end
