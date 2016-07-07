class Vehicle
  @@vehicles = []
  attr_reader(:make, :model, :year, :id)

  define_method(:initialize) do |attributes|
    @make = attributes.fetch(:make)
    @model = attributes.fetch(:model)
    @year = attributes.fetch(:year)
    @id = @@vehicles.length().+(1)
  end

  define_singleton_method(:all) do
    @@vehicles
  end

  define_method(:save) do
    @@vehicles.push(self)
  end

  define_singleton_method(:clear) do
    @@vehicles = []
  end

  define_singleton_method(:find) do |id|
    found_vehicle = nil
    @@vehicles.each() do |vehicle|
      puts vehicle
      if vehicle.id().eql?(id)
        found_vehicle = vehicle
      end
    end
    found_vehicle
  end

  define_method(:age) do
    current_year = Time.new().year()
    current_year.-(@year)
  end

  define_method(:worth_buying?) do
    american_cars = ["Chrysler", "Ford", "GM"]
    american_cars.include?(@make).&(self.age().<=(15))
  end

end
