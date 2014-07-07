class Candidate < ActiveRecord::Base
  def self.vote id
    self.where(id: id).first.increment!(:count, 1)
  end
end
