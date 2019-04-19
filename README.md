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
1. String can be created by quotes `''` and `""`, or flexible quote `%()`, `%!!`, `%{}`
2. Create String with document:
    ```ruby
    <<EOS
    It was the best of times,
    It was the worst of times.
    EOS
    ```
    Notice it counts as two lines
3. Flexible quote can handle multiple lines (\n character automatically added)
4. String can be appended by `<<` (like Array). **This is preferred**
5. Single quoted String escape `\'`, double quoted String escape `\"`. Both escape `\\`
6. Only double quote recognize `\n` as one char
7. Create single character string by `?a`, `?b`, etc
8. Use `.split(/some_regex/)` to split. Use `.split` to split with space
9. Use `.join(" ")` to join
10. `"a string" == "a string" && "a string".object_id != "a string".object_id`

## Symbol
1. Symbol is created by `s = :some_symbol`
2. Identical symbols are a single internal object. i.e. `:a.object_id == :a.object_id`
3. When you create class, functions, and variables, they automatically become symbols
4. If a symbol has space, create by `:"some symbol"`, or `"some symbol".to_sym`
5. Symbols are **immutable**, but they are not immutable Strings
6. Symbols can be useful as hash keys, since they are fast-accessible

## Regexp
1. Create Regexp by `r = /some_regexp/`
2. Return first match (or nil) by `"some_string"[/some_regexp/]`
3. Select group by `"Gray, James"[/(\w+), (\w+)/, 1]`. Groups are stored in $1, $2, etc
4. Use `.scan` to return all groups as Array
5. Use `"one two-three".sub(/(t\w*)/) { $1[0, 1] }` to replace first match
6. Use `"one two-three".gsub(/(t\w*)/) { $1[0, 1] }` to replace all

# Methods
1. Method calls can incurred by `my_global_method(2,3)` or `my_global_method 2, 3`
2. Default methods parameters by
    ```ruby
    def method_with_defaults(a, b=:default_value)
        [a, b]
    end
    ```
3. Create vararg method by `method_with_var_args(*args)`
4. Method return can be explicit (`return xxx`) or implicit (put `xxx` on the last line)
5. Make method private by `private :my_private_method`, or use private as a line boundary
6. Create keyword method by `def method_with_keyword_arguments(one: 1, two: 'two')`

# Constant
1. Top level constant (global variables are referenced by `::`)
2. Constants are default to public
3. Subclass can inherit parent's method

# If & Else
1. `unless (...)` is `if !(...)`
2. `next` is `continue` in Java
3. Repeat by 
    ```ruby
    10.times do
        sum += 1
    end
    ```
4. `if a != nil` can be simplified as `if a`

# Exception
1. Never rescue Exception in Ruby! Rescue StandardError instead.
2. RuntimeError < StandardError < Exception < Object
3. Instead of try, throw, catch, and finally, Ruby have `begin`, `raise`, `rescue`, and `ensure`

# Iteration
1. Use `.each` as foreach in Java
2. Stream calculate by `.collect` or `.map`
3. Filter elements by `.select` or `.find_all`
4. Use `.find` as findFirst in Java
5. `.inject` can be used as accumulator
6. Iterators can work with Array and Range, but will return Array no matter what

# Block
1. `yield` is a placeholder. Outside block can override `yield`
2. `block_given?` returns true if yield is overrode
3. Define lambda function by `func = lambda { |x| ... }`. Call it by `func.call(x)` or `func[x]`
4. Lambda function can be passed by `&func`
5. Having `yield` in method is perfect for sandwich code pattern. Abstract the file io, exception handling, etc, you can focus on business logic

# Class & Object
1. Define field as `@field1`, they are private by default
2. You can define field inside methods. It will be dynamically created once the method is called
3. You can still access private field by calling `.instance_variables`, which returns a Hash
4. You can also use `.instance_eval { @name }` or `.instance_eval("@name")` to access private field
5. Use `attr_reader :field_name` to define getter
6. Use `attr_accessor :name` to define getter and setter
7. Constructor is done by `def initialize(initial_arg)`
8. Class can be redefined, even including built-in class
9. Use `.ancestors` to return array of inheritance ancestors
10. `super` refer to parent method, not class. Unlike Java, you can't call `super.parent_method`
11. Class is also an object!
12. You can define method on object instead of class. It will only affect one object
13. Define static method by `def ClassName.a_class_method` or `def self.a_class_method`, or 
    ```ruby
    class Dog
      class << self
        def another_class_method
          :still_another_way
        end
      end
    end
    ```
14. Use `.send(:method_name)` or `.__send__(:method_name)` to dynamically invoke method
15. Use `.respond_to?(:method_name)` to dynamically check method

# Module
1. Modules are not classes. You can't initialize an object out of it
2. Use `include some_module` to import it
3. Classes with same name but different module are not the same class (because of scoping).
4. Name in scope overrides from inside to outside. If you don't specify scope, the default is the inner most name
5. Class names are just constants
6. Use `.const_get` to dynamically load constant
7. Use `.constants` to return a list of constant in this scope

# Misc
1. Don't just override `to_s`, do it to `to_str` as well.