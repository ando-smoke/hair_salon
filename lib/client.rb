class Client

  attr_reader(:first_name, :last_name)

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
      id = client["id"]
      first_name = client["first_name"]
      last_name = client["last_name"]
      stylist_id = client["stylist_id"]
      clients.push(Client.new({ :id => id,
        :first_name => first_name, :last_name => last_name,
        :stylist_id => stylist_id }))
    end
    clients
  end

  # define_method(:==) do
  #
  # end

end
