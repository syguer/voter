require 'rails_helper'

RSpec.describe Candidate, :type => :model do
  describe '#vote' do
    before :all do
      @before = Candidate.create({
        name: 'hoge',
        url: 'http://hoge.example.com/',
        count: 0
      })
    end

    before :each do
      Candidate.vote @before.id
      @actual = Candidate.where(@before.id).first
    end

    after :all do
      Candidate.delete_all
    end

    it 'increases the count by 1' do
      expect(@actual.count).to eq (@before.count + 1)
    end
  end
end
