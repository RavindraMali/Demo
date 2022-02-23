class ApplicationController < ActionController::Base
    # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    before_action :common_header
    def common_header
        @common_header = Page.all
    end
    
   
    # private
    # def record_not_found
    #     render plain: "404 Not Found", status: 404
    # end
end     
