class Client

  attr_reader(:id, :first_name, :last_name, :stylist_id)

  define_method(:initialize) do |attributes|
    @id = attributes[:id]
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @stylist_id = attributes[:stylist_id]
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      id = client["id"].to_i()
      first_name = client["first_name"]
      last_name = client["last_name"]
      stylist_id = client["stylist_id"].to_i()
      clients.push(Client.new({ :id => id,
        :first_name => first_name, :last_name => last_name,
        :stylist_id => stylist_id }))
    end
    clients
  end

  define_method(:==) do |other_client|
    id() == other_client.id() &&
      last_name() == other_client.last_name() &&
      first_name() == other_client.first_name() &&
      stylist_id() == other_client.stylist_id()
  end

  define_method(:save) do
    result = DB.exec(
      "INSERT INTO clients (first_name, last_name, stylist_id) " \
      "  VALUES('#{first_name()}', '#{last_name()}', '#{stylist_id()}') "\
      "  RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

end
