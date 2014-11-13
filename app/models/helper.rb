require 'find'

class Helper
  def self.search_file( file_name )
    files = Path.where "file_name LIKE '%#{file_name}%'"

    return files
  end

  def self.index
    Path.delete_all
    Find.find("#{ENV['HOME']}/Music") do |path|
      if FileTest.directory?(path)
        if File.basename(path)[0] == ?.
          Find.prune
        else
          next
        end
      else
        Path.create!(:index => path, :file_name => File.basename(path))
      end
    end
  end

  if Path.all.empty?
    false
  else
    true
  end
end
