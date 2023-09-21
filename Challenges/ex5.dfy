/*
    The following Dafny method PropertyTester asserts an arithmetic property. Unfortunately Dafny
    does not ‘know’ this property so the assertion fails.
      
    // description of the property here
      method PropertyTester(n: nat, k: nat)
      requires n%2==1
      {
         assert n*(n+2) != k*k;
      }

    i)  Replace the comment at the top of the tester with a one-line sentence that states the property. 
    Use simple, conceptual English, with no technical jargon, no variable names and no Dafny-speak.

    ii)  Write a level-3 lemma that proves the assertion. Use the signature:
            lemma LemNPS(n: nat, k: nat)

    iii) Modify the tester to demonstrate that Dafny has ‘learnt’ the property.

*/

lemma LemNPS(n: nat, k: nat)
requires n%2==1
ensures n*(n+2) != k*k
{
    //proof by contradiction
    if n*(n+2) == k*k {    
        //if n*(n+2) == k*k then there should exist a number p>0 which divides them both
        var p:nat :| 0<p && (k*k/p)%1==0;       //find p value which divides k*k
        assert n!=0 ==> (n*(n+1)/p)%1!=0;       //ensure that when n!=0 then false
    }
    assert n*(n+2) != k*k;
}

// for all natural numbers n and k if n is odd then n*(n+2) cannot be a square number
method PropertyTester(n: nat, k: nat)
requires n%2==1
{
    LemNPS(n, k);
    assert n*(n+2) != k*k;
}