class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :posting_page
end
