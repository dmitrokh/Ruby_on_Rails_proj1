class Pokemon < ApplicationRecord
  belongs_to :trainer, optional: true
  validates :name, presence: true, uniqueness: true
  validates :ndex, presence: true
end
