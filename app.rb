require 'pry'

class Elevator
  def initialize(floors, location = 0, state = "idle")
    @floors = floors
    @location = location
    @state = state
  end

  def location
    @location
  end

  def up(destination_floor)
    if destination_floor > @floors
      puts "This building is only #{@floors} floors tall"
    elsif destination_floor < @location
      puts "Please use the down button"
    else
      until @location == destination_floor
        @state = "going up"
        @location += 1
      end
    end
  end

  def down(destination_floor)
    until @location == destination_floor
      @state = "going down"
      @location -= 1
    end
  end
end

class Building
  def initialize(floors)
    @floors = floors
  end
end

class System
  def initialize(building_name, elevators = [])
    @building = building_name
    @elevators = elevators
  end

  def elevators
  end
  #a system tells the elevator to come to floor 18 and bring
  #the patron to the lobby
  def call_elevator(floor, elevator)
    if elevator.location > floor
      elevator.down(floor)
    else
      elevator.up(floor)
    end
  end
end

@system = System.new("Empire State")
@elevator = Elevator.new(30)


puts "Current elevator location is #{@elevator.location}"
@system.call_elevator(15, @elevator)
puts "Current elevator location is #{@elevator.location}"
@system.call_elevator(10, @elevator)
puts "Current elevator location is #{@elevator.location}"
@system.call_elevator(40, @elevator)
puts "Current elevator location is #{@elevator.location}"
