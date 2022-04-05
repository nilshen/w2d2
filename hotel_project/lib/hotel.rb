require_relative "room"

class Hotel
    attr_reader :rooms
    def initialize(name, capacities)
        @name = name
        @rooms = {}

        capacities.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity) 
        end
    end

    def name
    @name.split(" ").map(&:capitalize).join(" ")
    end

    def room_exists?(str)
        if rooms.has_key?(str)
            return true
        end
    false
    end 

    def check_in (name, room_name)
        
        if room_exists?(room_name) 
            if rooms[room_name].add_occupant(name)
                puts "check in successful"
            else 
                puts "sorry, room is full"
            end
        
        else 
            puts "sorry, room does not exist"
                
        end
    end

    def has_vacancy?
        @rooms.values.any? {|room| room.available_space >0 }
    end

    def list_rooms
        @rooms.each do |room_name, value| 
            puts "#{room_name} + #{value.available_space}" 
        end
    end








end
