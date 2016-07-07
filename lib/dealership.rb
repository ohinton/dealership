class Dealership
  @@dealerships = []
  attr_reader(:name, :cars, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = @@dealerships.length + 1
    @cars = []
  end

  # def id
  #   @id
  # end

  def save
    @@dealerships.push(self)
  end

  define_singleton_method(:all) do
    @@dealerships
  end

  define_singleton_method(:clear) do
    @@dealerships = []
  end

  define_singleton_method(:find) do |id|
    found_dealership = nil
    @@dealerships.each() do |dealership|
      if dealership.id().eql?(id)
        found_dealership = dealership
      end
    end
    found_dealership
  end

  def add_vehicle(vehicle)
    @cars << vehicle
  end
end
