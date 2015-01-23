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

end
