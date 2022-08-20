class ApiController < ApplicationController
    before_action :validate
    
    def index
       
        case params[:type]
        when 'cvm' 
        end
        render json: {:data => {:msg => 'Success'}}, status: 200
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def validate
        
        # if params[:validation_token] === ENV['BACKEND_VALIDATION_TOKEN']
        #    return true
        # else
        #     render json: {:data => {:msg => 'validation_token is required'}}, status: 500
        # end
    end
end