# Ruby Algorithm Practice

## Compare Nested Structures

### Challenge:
Compare the nesting structure of two arrays and return true if the argument provided is an array with the same nesting structure as the array upon which the function was called.

Write an algorithm that will...
- take an array as an argument

And return...
- true if the nested structure of the array provided matches the nested structure of the array upon which the function was called.
- false if the nested structures differ.

NOTE:

Example: 

True: 
[1, [1, 2, 3]].sameStructureAs([2, [3, 3, 3], 1])

False:
[[], [[]]].sameStructureAs([[[]], [[]]])
