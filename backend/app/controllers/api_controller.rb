class ApiController < ApplicationController
    before_action :validate
    
    def index
        case params[:type]
        when 'properties'
            
            final = []
            Property.all.each do |property|

                obj = property.attributes.merge({traps: property.traps})
                final.push(obj)
            end
           
            render json:{:data => final}, :status => 200
        when 'entries'

            property = Property.find_by(id: params[:id])
            entries = property.entries
        end
    end
    
    def show
        case params[:type]
        when 'property'
            property = Property.find_by(id: params[:id])
            property = property.attributes.merge({traps: property.traps, entries: property.entries.order("activity_date DESC").order("unique_identifier DESC")}) rescue nil

            render json:{:data => property }, :status => 200
        end
    end

    def create
    end

    def update
        case params[:type]
        when 'entry'
            
            entry = Entry.find_by(id: entry_params[:id])
            entry.update(
                corrective_action_date:entry_params[:corrective_action_date],
                corrective_action_msg: entry_params[:corrective_action_msg]
            )
            
            entry_params[:corrective_action_img_file].present? ? entry.image.attach(entry_params[:corrective_action_img_file]) : nil
            img_url = url_for(entry.image)

            entry.update(
                corrective_action_image: img_url
            )

            render json:{:data => entry }, :status => 200
            # entry.image.attach(params[:file])
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def validate
        unless params[:api_token] == ENV['API_TOKEN']
            render json: {:msg => 'Invalid API token'}, status: 401
        end
    end

    def entry_params
        params.permit(:id, :corrective_action_msg, :corrective_action_date, :corrective_action_img_file, :type, :api_token)
    end
end