/* func_0207d9f4: doubly-linked-list unlink. Splice node `n` out (next at +8,
 * prev at +12); patch neighbour links or the head/tail holder `o`; return next. */
int func_0207d9f4(int *o, int *n){
    int next = n[2];
    int prev = n[3];
    if (next) ((int *)next)[3] = prev; else o[0] = prev;
    if (prev) ((int *)prev)[2] = next; else o[1] = next;
    return next;
}
