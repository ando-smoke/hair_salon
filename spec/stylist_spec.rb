require("spec_helper")

describe(Stylist) do

  describe(".all") do
    it("is empty at first") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#first_name") do
    it("returns the first name of a stylist") do
      stylist_1 = Stylist.new({ :id => nil,
        :first_name => "Paul", :last_name => "Mitchell"})
      expect(stylist_1.first_name()).to(eq("Paul"))
    end
  end

  describe("#last_name") do
    it("returns the last name of a stylist") do
      stylist_1 = Stylist.new({ :id => nil,
        :first_name => "Paul", :last_name => "Mitchell"})
      expect(stylist_1.last_name()).to(eq("Mitchell"))
    end
  end

  describe("#id") do
    it("returns the ID of a stylist") do
      stylist_1 = Stylist.new({ :id => 3,
        :first_name => "Paul", :last_name => "Mitchell"})
      expect(stylist_1.id()).to(eq(3))
    end

    it("sets its ID when you save it") do
      stylist_1 = Stylist.new({ :id => nil,
        :first_name => "Paul", :last_name => "Mitchell"})
      stylist_1.save()
      expect(stylist_1.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same id, first name " \
      "and last name") do
      stylist_1 = Stylist.new({ :id => nil,
        :first_name => "Paul", :last_name => "Mitchell"})
      stylist_2 = Stylist.new({ :id => nil,
        :first_name => "Paul", :last_name => "Mitchell"})
      expect(stylist_1).to(eq(stylist_2))
    end
  end

  describe("#save") do
    it("lets you save stylists to the database") do
      stylist_1 = Stylist.new({ :id => nil,
        :first_name => "Vidal", :last_name => "Sassoon"})
      stylist_1.save()
      expect(Stylist.all()).to(eq([stylist_1]))
    end
  end

  describe(".find") do
    it("returns a stylist by their ID number") do
      stylist_1 = Stylist.new({ :id => nil,
        :first_name => "Vidal", :last_name => "Sassoon"})
      stylist_1.save()
      stylist_2 = Stylist.new({ :id => nil,
        :first_name => "Paul", :last_name => "Mitchell"})
      stylist_2.save()
      expect(Stylist.find(stylist_2.id())).to(eq(stylist_2))
    end
  end

  describe(".all_clients") do
    it("returns an array of all clients of a stylist") do
      stylist_1 = Stylist.new({ :id => nil,
        :first_name => "Vidal", :last_name => "Sassoon"})
      stylist_1.save()
      client_1 = Client.new({ :id => nil,
        :first_name => "Billy", :last_name => "Blanks",
        :stylist_id => stylist_1.id()})
      client_1.save()
      client_2 = Client.new({ :id => nil,
        :first_name => "Nigel", :last_name => "Tufnel",
        :stylist_id => stylist_1.id()})
      client_2.save()
      expect(stylist_1.all_clients()).to(eq([client_1, client_2]))
    end
  end

end
