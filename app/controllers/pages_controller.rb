class PagesController < ApplicationController
    def page
        @page = Page.where(slug: params[:slug]).first
    end
end

