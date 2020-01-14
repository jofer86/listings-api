# frozen_string_literal: true

require 'rails_helper'

class ListingsController < ApplicationController
  def index
    listings = Listing.latest
    render json: listings
  end

  def show; end

  def update; end

  def create; end

  def destroy; end
end
