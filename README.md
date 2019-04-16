# My answers of RubyKoans tutorial

## nil
1. nil is an object of `NilClass`
2. `NoMethodError` happens when calling undefined method
3. `nil.to_s == '' && nil.inspect == 'nil'`
4. `nil.nil? == true`

## Object
1. Just like Java, everything is an object
2. You can use `.to_s?` and `.inspect` on everything, inspect is used more for debugging and to_s for end-user or display purposes.
3. Every object can be created by `obj = Object.new`
4. Every object has an unique id (integer), which can be referenced as `.object_id`
5. Use `.clone` to make a copy, they will have different id

## Array
1. Creat array by `a = [1, 2, 3]`
2. `.size` returns size
3. You can insert element by `a[a.size] = 'new element'`, or `a << 'new element'`
4. You can insert element greater than size, the gap will be filled by nil
5. There will be no arry out of boundary exception. It will return nil instead
6. Arrays has `.first` and `.last` methods
7. Just like Python, `a[-n] == a[-n + a.size]`
8. `a[start, length]` returns subarray. If length is out of boundary, it will return subarray to the boundary. If start is out of boundary, it will return nil
9. `a[start..end]` return subarray including end. `a[start...end]` return subarray excluding end. 
10. Create Range by `r = (1..5)` (end inclusive) or `r = (1...5)` (end exclusive)
11. You can convert Range to Array by `.to_a` 
12. Array can `.push` and `.pop` like stack
13. Array can `.unshift` (enqueue) and `.shift` (dequeue) like queue
14. Initialize arrays:
    1. Symbol array: `a = %i[peanut butter and jelly]`
    2. String array: `s = %w[John Smith]` (no variable interpolation) or `s = %W[John Smith]` (double quote)

## Parallel assignment
1. Parallel assignment is executed simultaneously `x,y = y,x` will swap x and y
2. When lvalue and rvalue has same size, no problem.
3. One way to force parallel assignment
    ```ruby
    x = [1,2]    # x becomes [1,2]: this is not parallel assignment
    x, = [1,2]   # x becomes 1: the trailing comma makes it parallel
    ```
4. When there are more lvalues than rvalues, assign extra lvalues to nil
5. When there are less lvalues than rvalues, extra rvalues are not assigned
6. Splat operator:
    ```ruby
    x, y, z = 1, *[2,3]  # Same as x,y,z = 1,2,3
    x,*y = 1, 2, 3  # x=1; y=[2,3]
    x,*y = 1, 2     # x=1; y=[2]
    x,*y = 1        # x=1; y=[]
    ```

## Hash
1. Create Hash by `h = { one: 'uno', two: 'dos' }`
2. `h[:not_exist]` can return nil, `h[:not_exist]` will raise `KeyError`
3. Use `.include?` to check existence
4. `.keys` returns array of keys, `.values` returns array of values
5. Hash can merge another hash by `.merge`
6. You can init a Hash with default by `Hash.new('some_default')`
7. Default value of a Hash is a single mutable object. This default object is shared across Hash
8. If you don't want to share the default object, do `hash = Hash.new {|hash, key| hash[key] = 'some_default'}`

## String