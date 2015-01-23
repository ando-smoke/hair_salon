class Stylist

  attr_reader(:id, :first_name, :last_name)

  define_method(:initialize) do |attributes|
    @id = attributes[:id]
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec(
      "SELECT * " \
      "FROM stylists " \
      "ORDER BY last_name, first_name;")
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

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id() == id
        found_stylist = stylist
        break
      end
    end
    found_stylist
  end

  define_method(:==) do |other_stylist|
    id() == other_stylist.id() &&
      last_name() == other_stylist.last_name() &&
      first_name() == other_stylist.first_name()
  end

  define_method(:save) do
    result = DB.exec(
      "INSERT INTO stylists (first_name, last_name) " \
      "  VALUES('#{first_name()}', '#{last_name()}') "\
      "  RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:all_clients) do
    stylist_clients = []
    returned_clients = DB.exec(
      "SELECT * " \
      "FROM clients " \
      "WHERE stylist_id = #{id()} " \
      "ORDER BY last_name, first_name;")
    returned_clients.each() do |client|
      id = client["id"].to_i()
      first_name = client["first_name"]
      last_name = client["last_name"]
      stylist_id = client["stylist_id"].to_i()
      stylist_clients.push(Client.new({ :id => id,
        :first_name => first_name, :last_name => last_name,
        :stylist_id => stylist_id }))
    end
    stylist_clients
  end

end
