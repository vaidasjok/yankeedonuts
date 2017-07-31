class StaticPagesController < ApplicationController
  
layout "layout2", :only => [ :our_work, :contact, :delivery, :events ]

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

end
