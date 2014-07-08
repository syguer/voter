module Candidates
  class API < Grape::API
    format :json

    resource :candidates do
      desc "Return all candidates"
      get '/' do
        Candidate.all
      end

      desc "Add a new candidate"
      params do
        requires :name, type: String, desc: "Item name"
        requires :url, type: String, desc: "Reference url"
      end
      post '/' do
        Candidate.create({
          name: params[:name],
          url: params[:url],
          count: 0
        })
      end

      desc "vote to specified candidate"
      put '/:id' do
        Candidate.vote params[:id]
      end

      desc "Delete a specified candidate"
      delete '/:id' do
        Candidate.delete params[:id]
      end
    end
  end
end
