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
    @donuts = Donut.all
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
    when "contact", "menu"
      "layout_contact"
    else
      "layout2"
    end
  end


end
