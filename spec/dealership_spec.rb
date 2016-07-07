require('rspec')
require('dealership')
require('vehicle')

describe(Dealership) do
  before() do
    Dealership.clear()
  end

  describe('#name') do
    it('returns the name of the dealership') do
      test_dealership = Dealership.new(:name => "Maurys Automotive")
      expect(test_dealership.name()).to(eq('Maurys Automotive'))
    end
  end

  describe('#id') do
    it('returns the name of the dealership') do
      test_dealership = Dealership.new(:name => "Maurys Automotive")
      expect(test_dealership.id()).to(eq(1))
    end
  end

  describe('#save') do
    it('returns the name of the dealership') do
      test_dealership = Dealership.new(:name => "Maurys Automotive")
      test_dealership.save()
      test_dealership2 = Dealership.new(:name => "Jane's Cars")
      test_dealership2.save()
      expect(test_dealership2.id()).to(eq(2))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved dealerships") do
      Dealership.new(:name => "Maurys Automotive").save()
      Dealership.clear()
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a dealership by its id number") do
      test_dealership = Dealership.new(:name => "Maurys Automotive")
      test_dealership.save()
      test_dealership2 = Dealership.new(:name => "Jane's Cars")
      test_dealership2.save()
      expect(Dealership.find(test_dealership.id())).to(eq(test_dealership))
    end
  end

  describe('#add_vehicle') do
    it('adds a vehicle to the cars array') do
      test_dealership = Dealership.new(:name => "Maurys Automotive")
      test_vehicle = Vehicle.new({:make=> "Toyota", :model => "Prius", :year => 2000, :color => "blue", :engine_size => "4L", :number_of_doors => "4"})
      test_dealership.add_vehicle(test_vehicle)
      expect(test_dealership.cars()).to(eq([test_vehicle]))
    end
  end

end
