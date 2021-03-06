class StaticPagesController < ApplicationController
  before_filter :find_day_start, :find_view_type

  require 'json'
  def index
    @title = 'Home'
    @user = current_user
    @micropost = Micropost.new
    @location = request.location
    @mostly_connected = User.mostly_connected.limit(15)
  end

  def staticcontact
    @user = current_user
    @title = 'Contact Information'
  end

  def by_company
    company_code = params[:company_code].gsub('-', ' ')
    @title = "Search by Company: #{company_code}"
    @user = current_user
    @hotels = Hotel.where(owner: company_code).paginate(page: params[:page])     
  end

  def by_country
    @title = "Search by Country: #{params[:country_code]}"
    @user = current_user
    @hotels = Hotel.where(country: params[:country_code]).paginate(page: params[:page])
  end

  def by_city
    city_code = params[:city_code].underscore.humanize.titleize
    @title = "Search by City: #{city_code}"
    @user = current_user
    @hotels = Hotel.where(city: city_code).paginate(page: params[:page])
  end

private
  def find_day_start
    @day_start = if params[:day_start]
                   Date.parse(params[:day_start])
                 else
                   Date.today
                 end
  end

  def find_view_type
    @view_type = params[:view_type] ? params[:view_type].to_sym : :thumbnail
  end

end
