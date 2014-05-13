class Project < ActiveRecord::Base
  validates :technologies_used, presence: true
  validates :name, length: {in:3..300}
end
