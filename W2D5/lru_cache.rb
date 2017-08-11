class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    @cache.delete(el) if @cache.include?(el)
    @cache.shift if count >= @size
    @cache << el
  end

  def show
    p @cache
  end

end
