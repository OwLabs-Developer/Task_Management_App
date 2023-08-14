class DashboardsController < ApplicationController

    def landing_page
    end

    def index 
        @dashboards = Dashboard.all
    end

    def show 
        @dashboard = Dashboard.find(params[:id])
    end
end
