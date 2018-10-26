class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    self.queue.push(el)
  end

  def dequeue
    self.queue.shift
  end

  def peek
    self.queue.first
  end
end
