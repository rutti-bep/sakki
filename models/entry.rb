class Entry
  COLUMNS = [:id, :title, :body, :posted_at, :published]
  COLUMNS.each do |column|
     attr_accessor column
  end
end
