# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @message = 'こんにちは、Rails!'
  end
end
