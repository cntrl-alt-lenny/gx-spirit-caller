/* func_02064d58: record comparator — compare *(*a0) vs *(*a1); on tie, return the
 * sign-extended f4(u16) delta. Legacy 1.2/sp2p3 (predicated tie-break). */
int func_02064d58(int **a0, int **a1){
    int *p = *a0;
    int *q = *a1;
    if (*p != *q) return *p - *q;
    return (short)(*(unsigned short *)((char *)p + 4) - *(unsigned short *)((char *)q + 4));
}
