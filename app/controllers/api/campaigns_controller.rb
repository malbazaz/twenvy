class Api::CampaignsController < ApplicationController
    
    def index
        @campaigns = Campaign.all 
        render json: @campaigns, status: 200
    end 

    def create
        @campaign = Campaign.create(campaign_params)
        if @campaign.save
            render json: @campaign
        else 
            render json: {message: campaign.errors}, status: 400
        end
    end 

    def show 
        @campaign = Campaign.find_by_id(params[:id])
        render json: @campaign
    end

    def update
        @campaign = Campaign.find_by_id(params[:id])
        if @campaign.update(campaign_params)
            render json: @campaign
        else 
            render json: {message: @campaign.errors}, status: 400
        end 
    end



    private

    def campaign_params
        params.require(:campaign).permit(:product_id, :end_date, :location, :target_qty, :sold_qty)
    end

end
