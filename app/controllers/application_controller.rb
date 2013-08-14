class ApplicationController < ActionController::Base

  before_filter :authenticate_admin_user!

  require 'will_paginate/array'

  protect_from_forgery

  helper_method :sort_column, :sort_direction

  private

  def sort_direction  
    %w[ASC DESC].include?(params[:direction]) ?  params[:direction] : "DESC"  
  end

  def sort_column
    params[:sort] || "fecha_creacion"
  end
  
end
