class MainController < ApplicationController

  def index

  end

  def find
    files = Path.where "file_name LIKE '%#{params[:search_file]}%'"

    if !files.blank?
      @file = files.first
    else
      render plain: "Could not find file"
    end
  end

end
