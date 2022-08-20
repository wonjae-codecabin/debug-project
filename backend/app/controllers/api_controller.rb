class ApiController < ApplicationController
    before_action :validate
    
    def index
        # render json: {:data => {:msg => 'Success'}}, status: 200
       
    end

    def create
        Property.import(params[:file])
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def validate
    end
end