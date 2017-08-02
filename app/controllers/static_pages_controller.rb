class StaticPagesController < ApplicationController
  
layout :resolve_layout

  def home
  end

  def our_work
  end

  def contact
  end

  def delivery
  end

  def events
  end

  def menu
  end


private

  def resolve_layout
    case action_name
    when "home"
      "application"
    when "delivery"
      "layout2"
    when "events"
      "layout_events"
    else
      "layout_all"
    end
  end


end
