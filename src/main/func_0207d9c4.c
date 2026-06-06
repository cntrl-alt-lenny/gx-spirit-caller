/* func_0207d9c4: doubly-linked insert-after `a2` (or at head of `a0`); patch
 * neighbour f8/f12 links; return n. */
int *func_0207d9c4(int *a0, int *n, int *a2){
    int *r3;
    n[2] = (int)a2;
    if (a2){ r3 = (int *)a2[3]; a2[3] = (int)n; }
    else { r3 = (int *)a0[0]; a0[0] = (int)n; }
    n[3] = (int)r3;
    if (r3) r3[2] = (int)n;
    else a0[1] = (int)n;
    return n;
}
