class PagesController < ApplicationController
  def home
    @variable = 4
  end

  def hello
    @variable = 42
  end
end
