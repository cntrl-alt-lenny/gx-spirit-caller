/* func_0207d18c: seed a node — clear the (a1+idx) slot pair (idx = a0->fa u16),
 * point a0->f0/f4 at a1, bump the a0->f8 count. */
void func_0207d18c(int *a0, char *a1){
    int idx = *(unsigned short *)((char *)a0 + 10);
    *(int *)(a1 + idx + 4) = 0;
    *(int *)(a1 + idx) = 0;
    a0[0] = (int)a1;
    a0[1] = (int)a1;
    *(unsigned short *)((char *)a0 + 8) += 1;
}
