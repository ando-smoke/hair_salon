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

end
