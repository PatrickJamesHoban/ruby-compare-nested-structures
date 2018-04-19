# PSEUDOCODE

=begin 
Complete the function/method (depending on the language) to return true/True when its argument is an array that has the same nesting structure as the first array.

For example:

# should return true
[ 1, 1, 1 ].same_structure_as( [ 2, 2, 2 ] )
[ 1, [ 1, 1 ] ].same_structure_as( [ 2, [ 2, 2 ] ] )

# should return false 
[ 1, [ 1, 1 ] ].same_structure_as( [ [ 2, 2 ], 2 ] )
[ 1, [ 1, 1 ] ].same_structure_as( [ [ 2 ], 2 ] )

# should return true
[ [ [ ], [ ] ] ].same_structure_as( [ [ [ ], [ ] ] ] ); 

if x is an array
  check that y is also an array.
  if yes move on,
    if no, return false

=end


#CODE

# Final Refactor
class Array
  def same_structure_as(arr2)
    arr1 = self
    arr2 = arr2
    return false if !arr2.is_a? Array
    foundnest = true
    until foundnest == false
      foundnest = false
      arr1.each_with_index do |x, i|
        if x.is_a?(Array) 
          return false if !arr2[i].is_a?(Array)
          foundnest = true
        else 
          return false if arr2[i].is_a?(Array)
        end
      end
      arr1 = arr1.flatten(1)
      arr2 = arr2.flatten(1)
      return false if arr1.length != arr2.length
    end
    return true
  end
end

# OTHER ANSWERS
# Some interesting recursive answers in this one... 

# class Array

#   def same_structure_as(a)
#     return false if self.class!=a.class || size!=a.size 
#     a.each_index { |i| return false if self[i].class==Array && !self[i].same_structure_as(a[i]) }
#     true
#   end
  
# end

# class Array
#   def structure
#     map { |it| it.is_a?(Array) ? it.structure : nil }
#   end
  
#   def same_structure_as(arr)
#     return false unless arr.is_a?(Array)
#     structure == arr.structure
#   end
# end

# First Attempt
# class Array
#   def same_structure_as(arr2)
#     p arr1 = self
#     p arr2 = arr2
#     foundnest = true
#     until foundnest == false
#       # until self.is_a?(Array) == 
#       foundnest = false
#       arr1.each_with_index do |x, i|
#         p 'x is ...'
#         p x
#         p 'i is ...'
#         p i
#         if x.is_a?(Array) 
#           p 'here'
#           p x
#           return false if !arr2[i].is_a?(Array)
#           # until x.is_a?(Array) == false
#           # end
#           foundnest = true
#         else 
#           return false if arr2[i].is_a?(Array)
#         end
#       end
#       arr1 = arr1.flatten(1)
#       arr2 = arr2.flatten(1)
#     end
#     return true
#   end
# end


#DRIVER CODE

# p [ 1, [ 1, 1 ] ].same_structure_as( [ [ 2, 2 ], 2 ] ) # false
# p [ 1, [ 1, 1 ] ].same_structure_as( [ 2, [ 2, 2 ] ] ) # true
# p [ 1, [ 1, 1 ] ].same_structure_as( [ [ 2 ], 2 ] ) # false
# p [1,[1,1]].same_structure_as( [2,[2]] ) # false
# p [1,[1,[1]]].same_structure_as([2,[2,2]]) # false
# p [1].same_structure_as([[1]]) # false

p [1, [1, 2, 3]].same_structure_as([2, [3, 3], 1]) # true

p [[], [[]]].same_structure_as([[[]], [[]]]) # false

p 54.same_structure_as([54]) # Fixnum no method error. This is expected since I'm just appending the function to the Array class.

