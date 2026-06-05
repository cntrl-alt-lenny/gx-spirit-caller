/* func_0202b100: g = *global; k = func_0202b0b4(a0); return g->f4 + g->f8[k*2].
 * (g->f8 is an int table, indexed by the call result doubled.) */
extern int *data_0219a93c;
extern int func_0202b0b4(int);
int func_0202b100(int a0){
    int *g = data_0219a93c;
    int k = func_0202b0b4(a0);
    int *tbl = (int *)g[2];
    return g[1] + tbl[k * 2];
}
