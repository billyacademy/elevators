class Elevator
  def initialize(floors, location = 0)
    @floors = floors
    @location = location
  end

  def location
    @location
  end

  def up(destination_floor)
    if destination_floor < @location
      puts "Please use the down button"
    else
      until @location == destination_floor
        @location += 1
      end
    end
  end

  def down(destination_floor)
    until @location == destination_floor
      @location -= 1
    end
  end
end



class System

end

@elevator = Elevator.new(30)

puts "Current elevator location is #{@elevator.location}"
@elevator.up(15)
puts "Current elevator location is #{@elevator.location}"
@elevator.down(10)
puts "Current elevator location is #{@elevator.location}"
