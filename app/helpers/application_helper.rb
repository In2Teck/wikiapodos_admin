#!/bin/env ruby
# encoding: utf-8

module ApplicationHelper
  
  NEXT_LBL = " →"
  PREV_LBL = "← "

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "ASC" ? "DESC" : "ASC"
    link_to title, :sort => column, :direction => direction
  end

end
