class Stylist

  attr_reader(:id, :first_name, :last_name)

  define_method(:initialize) do |attributes|
    @id = attributes[:id]
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      id = stylist["id"].to_i()
      first_name = stylist["first_name"]
      last_name = stylist["last_name"]
      stylists.push(Stylist.new({ :id => id,
        :first_name => first_name, :last_name => last_name}))
    end
    stylists
  end

  define_method(:==) do |other_stylist|
    id() == other_stylist.id() &&
      last_name() == other_stylist.last_name() &&
      first_name() == other_stylist.first_name()
  end

end
