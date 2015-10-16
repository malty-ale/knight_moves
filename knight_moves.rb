class Try
  attr_accessor :place, :parent
end

class Knight
  def initialize
    @position = []
    @algebraic_moves = [[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2],[1,2]]
    @queue = []
  end
  
  def possible_moves(start,finish)
    x = start.place[0]
    y = start.place[1]
    ending_spots = []
    
    @algebraic_moves.each do |i|
      (x+i[0]).between?(0,7) ? a = x+i[0] : a = nil
      (y+i[1]).between?(0,7) ? b = y+i[1] : b = nil
      
      if (!a.nil? && !b.nil?)
        move = Try.new
        move.place = [a,b]
        move.parent = start
        @queue << move
      end
      
      break if [a,b] == finish
    end
  end
  
  def knight_moves(start,finish)
    @position = Try.new
    @position.place = [start[0], start[1]]
    possible_moves(@position,finish)

    while @queue[-1].place != finish
      possible_moves(@queue[0],finish)
      @queue.shift
    end
    
    display_values(@queue[-1],start)
  end
  
  def display_values(position,start)
    puts position.place.join(" ")
    return if position.place == start
    display_values(position.parent, start)
  end
    
end

a = Knight.new
a.knight_moves([3,3],[4,3])

