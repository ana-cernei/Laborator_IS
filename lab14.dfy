//Homework 4
//1.With the help of Dafny, find out the maximal value of the termination term accepted by the
//verifier for the Fibbonaci program (function above). Write the proof.
function Fib (n: nat) : nat
decreases n
{
if n < 2 then n else Fib(n - 2) + Fib(n - 1)
}
/*
Proof
analysis of the code -- The Fibonacci function recursively calls itself with n - 2 and n - 1.
 The decreases n clause indicates that n is what decreases with each recursive call, ensuring the recursion moves 
 towards the termination (base) case n < 2.
Recursive case -- If n >= 2, the function calls Fib(n - 2) and Fib(n - 1). Since both n - 2 and n - 1 are strictly less than n,
 and since n is a natural number, both these values are also non-negative.
Also, the natural numbers under the standard less-than relation form a well-founded set. This means there are no infinite descending 
chains,ensuring that every sequence of recursive calls will eventually reach the base case.
The maximal value of the termination term n is not capped within the function itself. It can be any natural number. The recursion's
nature guarantees termination as long as n starts from any natural number, as each step reduces n and moves towards the base case (n < 2).
*/

//2. With the help of Dafny, try different decreases expressions for the next functions and explain
//why do they work or why they don’t. Explain if the default decreases works.
function F(x: int): int 
  decreases x
{
  if x < 10 then x else F(x - 1)
}
/**Explanation: The decreases x clause ensures termination because x is decremented by 1 in each recursive call.
 This function will terminate as long as x is a finite integer because eventually x will be less than 10. */

 function G(x: int): int 
  decreases x
{
  if 0 <= x then G(x - 2) else x
}
/**Explanation: The decreases x clause works here assuming x starts non-negative. Each recursive call decreases x by 2,
 ensuring that x will eventually become negative, terminating the recursion. If x starts negative, it terminates immediately. */
function H(x: int): int 
  decreases 60 + x
  {
  if x < -60 then x else H(x - 1)
}
/**Explanation: The decreases 60 + x clause ensures that the function will terminate because x decreases each time but must remain 
greater than -60. Adding 60 ensures the termination metric is non-negative, and well-founded as x approaches -60 from above. */
function I(x: nat, y: nat): int 
  decreases x + y
  {
  if x == 0 || y == 0 then 12
  else if x % 2 == y % 2 then I(x - 1, y)
  else I(x, y - 1)
}
/**Explanation: The decreases x + y clause ensures that the sum of x and y is always decreasing 
with each call, which guarantees termination as one or both will eventually reach zero. */

function J(x: nat, y: nat): int 
  decreases x,y
  {
  if x == 0 then y
  else if y == 0 then J(x - 1, 3)  
  else J(x, y - 1)
}
/**The use of decreases x, y in function J ensures that either x decreases, or if x stays the same, then y decreases. 
This function setup guarantees that each recursive call moves towards a base case where x eventually becomes 0,
 at which point the recursion depth is solely controlled by decrementing y until it also reaches 0. */

 function K(x: nat, y: nat, z: nat): int 
  decreases x, y, z
  {
  if x < 10 || y < 5 then x + y
  else if z == 0 then K(x - 1, y, 5)
  else K(x, y - 1, z - 1)
}

function L(x: int): int
  decreases 100 - x
{
  if x < 100 then L(x + 1) + 10 else x
}
/*The decreases 100 - x clause ensures that the recursion terminates because 100 - x 
gets smaller with each recursive call where x < 100. When x reaches or exceeds 100, the recursion stops.*/





