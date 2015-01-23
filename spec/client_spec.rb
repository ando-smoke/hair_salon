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

  # describe("#==") do
  #   it("is the same client if it has the same id, first name " \
  #     "last name, and stylist id") do
  #     client_1 = Client.new({ :id => nil,
  #       :first_name => "Billy", :last_name => "Blanks",
  #       :stylist_id => 1})
  #     client_2 = Client.new({ :id => nil,
  #       :first_name => "Billy", :last_name => "Blanks",
  #       :stylist_id => 1})
  #     expect(client_1).to(eq(client_2))
  #   end
  # end

end
