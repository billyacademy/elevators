require 'pry'

class Elevator
  def initialize(name, floors, location = 0, state = "idle")
    @name = name
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
        puts "Status of #{@name}: #{@state}"
        @location += 1
        sleep(0.5)
        puts "#{@name} at floor #{@location}"
      end
    end
    @state = "idle"
    puts "Status of #{@name}: #{@state}"
  end

  def down(destination_floor)
    until @location == destination_floor
      @state = "going down"
      puts "Status of #{@name}: #{@state}"
      @location -= 1
      sleep(0.5)
      puts "#{@name} at floor #{@location}"
    end
    @state = "idle"
    puts "Status of #{@name}: #{@state}"
  end

  def buttons(floors)

  end
end

class Building
  attr_reader :name, :floors
  def initialize(floors, name)
    @floors = floors
    @name = name
  end
end

class System
  attr_accessor :elevators, :building_name

  def initialize(building_name, elevators = [])
    @building_name = building_name
    @elevators = elevators
  end

  def push_floor_button(elevator, button)

  end

  #a system tells the elevator to come to floor 18 and bring
  #the patron to the lobby
  def call_elevator_from_floor(floor, elevator)
    if elevator.location > floor
      elevator.down(floor)
    else
      elevator.up(floor)
    end
  end

  def send_elevator_from_inside(floor, elevator)

  end

  def closest_elevator(floor)
    min_distance = 1000
    @elevators.each do |elevator|
      distance = (elevator.location - floor).abs
      if distance <= min_distance
        @next_elevator = elevator
        min_distance = distance
      end
    end
    @next_elevator
  end
end

@building = Building.new(30, "Empire State")
@system = System.new(@building.name, [])
@elevator = Elevator.new("elevator1", @building.floors)
@elevator2 = Elevator.new("elevator2", @building.floors)

@system.elevators << @elevator
@system.elevators << @elevator2

queue = []






# puts "Current elevator location is #{@elevator.location}"
@system.call_elevator_from_floor(10, @system.closest_elevator(10))

@system.call_elevator_from_floor(4, @system.closest_elevator(4))
#
#
# puts "Person waiting on floor 10"
# closest_elevator = elevators.first
# elevators.each do |elevator|
#   distance = (elevator.location - 10).abs
#   if distance <= closest_elevator.location - 10
#     closest_elevator = elevator
#   end
# end
# @system.call_elevator_from_floor(10, closest_elevator)
#
# elevators.each do |elevator|
#   request = 8
#   distance = (elevator.location - request).abs
#   if distance <= closest_elevator.location - request
#     closest_elevator = elevator
#   end
# end
# @system.call_elevator_from_floor(request, closest_elevator)
#
# elevators.each do |elevator|
#   request = 2
#   distance = (elevator.location - request).abs
#   if distance <= closest_elevator.location - request
#     closest_elevator = elevator
#   end
# end
# @system.call_elevator_from_floor(request, closest_elevator)

# puts "Current elevator location is #{@elevator.location}"
# @system.call_elevator(10, @elevator)
# puts "Current elevator location is #{@elevator.location}"
# @system.call_elevator(40, @elevator)
# puts "Current elevator location is #{@elevator.location}"
