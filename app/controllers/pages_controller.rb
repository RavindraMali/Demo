class PagesController < ApplicationController
    def page
        @page = Page.where(slug: params[:slug]).first
        if @page.blank?
            render_404
         end
    end

    def render_404
        respond_to do |format|
          format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
          format.xml  { head :not_found }
          format.any  { head :not_found }
        end
    end
end

