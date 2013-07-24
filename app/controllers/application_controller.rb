class ApplicationController < ActionController::Base
  require 'will_paginate/array'

  protect_from_forgery

  helper_method :sort_column, :sort_direction

  private

  def sort_direction  
    %w[ASC DESC].include?(params[:direction]) ?  params[:direction] : "ASC"  
  end 

  def sort_column
    params[:sort] || "id"
  end
  
end
