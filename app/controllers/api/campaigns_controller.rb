require 'pry'
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
        # if params[:product_id]
        #     @product = Product.find_by_id(params[:product_id])
        #     response = { :campaign => @campaign, :product => @product }
        #     respond_to do |format|
        #         format.json  { render :json => response }
        #       end
        # else 
            render json: @campaign
        # end 
    end

    def update
        @campaign = Campaign.find_by_id(params[:id])
        if @campaign.update(qty_params)
            @campaign.save
            render json: @campaign
        else 
            render json: {message: @campaign.errors}, status: 400
        end 
    end



    private

    def campaign_params
        params.require(:campaign).permit(:product_id, :end_date, :location, :target_qty, :sold_qty)
    end

    def qty_params
        params.require(:campaign).permit(:sold_qty)
    end

end
