class API::CampaignsController < ApplicationController
    def index
        @campaigns = Product.all 
        render json: @campaigns, status: 200
    end 
end
