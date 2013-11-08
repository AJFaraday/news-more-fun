class Substitution < ActiveRecord::Base
  attr_accessible :from, :to

  validates_uniqueness_of :from

end
