/* 
    Hofstadter Female and Male sequences can be expressed as:
      Female(0) = 1 ; Male(0) = 0 
      Female(n) = n − Male(Female(n − 1)), n > 0
      Male(n) = n − Female(Male(n − 1)), n > 0
      Write recursive functions in Dafny to represent these sequences.

*/

function Female(n:int):int
decreases n,1
{
    if n == 0 then 1
    else n - Male(Female(n-1))
}

function Male(m:int):int
decreases m, 1
{
    if m == 0 then 0
    else m - Female(Male(m-1))
}