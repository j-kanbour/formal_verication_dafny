/*
    An array is said to be clumped if all equal elements in the array are consecutive in the array. 
    For example, 
        the following arrays are clumped: [42,42,42,1,1], [42], [1,2,-1,8,0]. 
        The following arrays are not clumped: [42,1,42],[0,-1,-1,-1,0]

    i)  Using only ‘forall’ quantifiers (1 or more), write a Dafny predicate clumped1 with signature: 
            predicate clumped1(a: array<int>)
        which returns true if the array a of integers is clumped, and false otherwise.

    ii) Write a tester method (call it anything you like) that checks the predicate Clumped1 
        for a full range of testcases. ’Full’ means that boundary cases are checked as well as 
        likely cases such as all elements are equal, all elements are different etc.

*/

predicate clumped1(a: array<int>)
reads a
{
    forall x,y :: 0<=x<y<a.Length && a[x] != a[x+1] ==> a[x] != a[y]
}

method TEST1()
{
    var a: array<int> := new int[5][42,42,42,1,1];
    assert clumped1(a);

    var b: array<int> := new int[1][42];
    assert clumped1(b);

    var c: array<int> := new int[5][1, 2, -1, 8, 0];
    assert clumped1(c);

    var d: array<int> := new int[3][42,1,42];
    assert d[0]==42 && d[1]==1 && d[2]==42;
    assert !clumped1(d);

    var e: array<int> := new int[5][0, -1, -1, -1, 0];
    assert e[0] == 0 && e[1] == -1 && e[2] == -1 && e[3] == -1 && e[4] == 0;
    assert !clumped1(e);

    var f: array<int> := new int[5][0, 0, 0, 0, 0];
    assert clumped1(f);

    var g: array<int> := new int[0][];
    assert clumped1(g);

    var h: array<int> := new int[5][42,1,42, 1,42];
    assert h[0]==42 && h[1]==1 && h[2]==42 && h[3]==1 && h[4]==42;
    assert !clumped1(h);

    var i: array<int> := new int[8][7,42,42,8,1,1, 2, 3];
    assert clumped1(i);

    var j: array<int> := new int[6][0, 0, -1, -1, 0, 0];
    assert j[0] == 0 && j[1] == 0 && j[2] == -1 && j[3] == -1 && j[4] == 0 && j[5] == 0;
    assert !clumped1(j);
}
