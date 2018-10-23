class Api::CampaignsController < ApplicationController
    
    before_action :set_campaign, only: [:show, :update]
    
    def index
        @campaigns = Product.all 
        render json: @campaigns, status: 200
    end 

    def create
        @campaign = Campaign.new(campaign_params)
        if campaign.save
            render json: @campaign
        else 
            render json: {message: campaign.errors}, status: 400
    end 

    def show 
        render json: Campaign.find_by(id: params[:id])
    end

    def update
        if @campaign.update(campaign_params)
            render json: @campaign
        else 
            render json: {message: @campaign.errors}, status: 400
        end 



    private

    def set_campaign
        @campaign = Campaign.find_by(id: params[id])
    end 

    def campaign_params
        params.require(:campaign).permit(:product_id, :end_date, :location, :target_qty, :sold_qty)
    end
end
