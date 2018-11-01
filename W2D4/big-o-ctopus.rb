def quadratic_biggest_fish(fishes)
  fishes.each_with_index do |ele1, idx1|
    max = true

    fishes.each_with_index do |ele2, idx2|
      if ele2 > ele1
        max = false
      end
    end

    return ele1 if max
  end

end

class Array
  def merge_sort(&prc)

    return self if self.length < 2

    middle = count / 2

    left = self.take(midpoint)
    right = self.drop(midpoint)

    sorted_left = left.merge_sort
    sorted_right = right.merge_sort

    Array.merge(sorted_left, sorted_right)
  end

  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      if left.first > right.first
        merged << right.shift
      end
    end

    merged + left + right
  end
end
