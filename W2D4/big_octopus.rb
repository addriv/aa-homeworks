fish_list = ['fish',
          'fiiish',
          'fiiiiish',
          'fiiiish',
          'fffish',
          'ffiiiiisshh',
          'fsh',
          'fiiiissshhhhhh']

def sluggish(fishes)
  fishes.each do |fish1|
    max_length = true
    fishes.each do |fish2|
      max_length = false if fish1.length < fish2.length
    end
    return fish1 if max_length
  end
end

p "sluggish: #{sluggish(fish_list)}"

def dominant(fishes)
  fishes.merge_sort {|fish1, fish2| fish2.length <=> fish1.length } [0]
end

p "domminant: #{dominant(fish_list)}"

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |num1, num2| num1 <=> num2 }
    return self if length <= 1
    mid = length / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)
    self.class.merge(left, right, &prc)
  end

  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when 0
        merged << left.shift
      when -1
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged += left
    merged += right
    merged
  end
end

def clever(fishes)
  longest_fish = fishes.first
  fishes[1..-1].each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end
  longest_fish
end

p "clever: #{clever(fish_list)}"

tiles_array = [
  "up",
  "right-up",
  "right",
  "right-down",
  "down",
  "left-down",
  "left",
  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, i|
    return i if tile == direction
  end
end

tiles_hash = {
  "up" => 1,
  "right-up" => 2,
  "right" => 3,
  "right-down" => 4,
  "down" => 5,
  "left-down" => 6,
  "left" => 7,
  "left-up" => 8
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
