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

  def retrieve_file
    @file = Path.find(params[:id])
    

    File.open(@file.path, 'rb') do |f|
      send_data f.read, :disposition => 'inline'
    end
  end

  def retrieve_index_photo
  
    File.open("#{Rails.root}/public/assets/images/assistant.png", 'rb') do |f|
      send_data f.read, :disposition => 'inline'
    end
  end
end
