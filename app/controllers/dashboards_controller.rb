class DashboardsController < ApplicationController

    def show 
        @dashboard = Dashboard.find(params[:id])
    end

    def index 
        @dashboards = Dashboard.all
end
