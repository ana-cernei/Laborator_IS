/**precondition,postcondition,functionality
Program Functionality: The method between takes two integer parameters p and r, and returns an integer q. The function of this method is to assign the value p + 1 to q and return it.
Precondition: The precondition requires r-p > 1 specifies that the difference between r and p must be greater than 1 for the method to execute properly.
Postcondition: The postcondition ensures p < q < r ensures that the returned value q is greater than p and less than r. This is a condition that needs to be true when the method finishes execution.
What happens if you change the body of the method with q := p + 2? Give a counterexample.

Change: If the body of the method is changed to q := p + 2, then the method will assign p + 2 to q.
Counterexample: Consider the case where p = 3 and r = 5. The original method with q := p + 1 results in q = 4, which satisfies the postcondition 3 < 4 < 5. However, if q := p + 2 is used instead, then q = 5, which does not satisfy the postcondition 3 < 5 < 5. Therefore, the postcondition fails in this scenario.
What happens if you change the precondition with r-p=1? Give a counterexample.

Change: Changing the precondition to requires r-p = 1 means the difference between r and p is exactly 1.
Counterexample: Let p = 2 and r = 3. With the original method body q := p + 1, this results in q = 3. Although the precondition r-p = 1 is satisfied, the postcondition 2 < 3 < 3 is not met, as q is not strictly less than r. Thus, the method violates its postcondition with this altered precondition.

*/


method between (p:int, r:int)returns (q:int)
requires r-p >1
ensures p<q<r
{
    q:=p+1;
}
 


 