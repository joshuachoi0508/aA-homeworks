class LRUCache
  def initialize(cache_size)
    @cache_size = cache_size
    @caches = []
  end

  def count
    @caches.count
  end

  def add(el)
    if @caches.include?(el)
      @caches.delete(el)
      @caches << el
    elsif count >= @cache_size
      @caches.shift
      @caches << el
    else
      @caches << el
    end
  end

  def show
    @caches
  end
end
