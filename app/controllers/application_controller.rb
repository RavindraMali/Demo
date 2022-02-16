class ApplicationController < ActionController::Base
    before_action :common_header
    def common_header
        @common_header = Page.all
    end
    
end     
