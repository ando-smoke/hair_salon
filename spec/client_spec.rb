require("spec_helper")

describe(Client) do

  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#first_name") do
    it("returns the first name of a client") do
      client_1 = Client.new({ :id => nil,
        :first_name => "Billy", :last_name => "Blanks",
        :stylist_id => 1})
      expect(client_1.first_name()).to(eq("Billy"))
    end
  end

  describe("#last_name") do
    it("returns the last name of a client") do
      client_1 = Client.new({ :id => nil,
        :first_name => "Billy", :last_name => "Blanks",
        :stylist_id => 1})
      expect(client_1.last_name()).to(eq("Blanks"))
    end
  end

  describe("#stylist_id") do
    it("returns the stylist id of a client") do
      client_1 = Client.new({ :id => nil,
        :first_name => "Billy", :last_name => "Blanks",
        :stylist_id => 1})
      expect(client_1.stylist_id()).to(eq(1))
    end
  end

  describe("#id") do
    it("returns the ID of a client") do
      client_1 = Client.new({ :id => 2,
        :first_name => "Billy", :last_name => "Blanks",
        :stylist_id => 1})
      expect(client_1.id()).to(eq(2))
    end

    it("sets its ID when you save it") do
      client_1 = Client.new({ :id => nil,
        :first_name => "Billy", :last_name => "Blanks",
        :stylist_id => 1})
      client_1.save()
      expect(client_1.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same client if it has the same id, first name " \
      "last name, and stylist id") do
      client_1 = Client.new({ :id => nil,
        :first_name => "Billy", :last_name => "Blanks",
        :stylist_id => 1})
      client_2 = Client.new({ :id => nil,
        :first_name => "Billy", :last_name => "Blanks",
        :stylist_id => 1})
      expect(client_1).to(eq(client_2))
    end
  end

  describe("#save") do
    it("lets you save clients to the database") do
      client_1 = Client.new({ :id => nil,
        :first_name => "Billy", :last_name => "Blanks",
        :stylist_id => 1})
      client_1.save()
      expect(Client.all()).to(eq([client_1]))
    end
  end

end
