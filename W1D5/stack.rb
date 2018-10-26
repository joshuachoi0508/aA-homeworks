class Stack
  def initialize(stack = [])
    @stack = stack
  end

  def push(el)
    @stack.push(el)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack[-1]
  end
end
