class DashboardController < ApplicationController

  before_filter :require_login

  def index
    @stats = Statistics.new
  end
end