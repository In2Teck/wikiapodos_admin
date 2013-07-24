class ApplicationController < ActionController::Base
  require 'will_paginate/array'

  protect_from_forgery

  helper_method :sort_column, :sort_direction

  private

  def sort_column
    params[:sort] || "id"
  end

  def sort_direction
    params[:direction] || "ASC"
  end
end
