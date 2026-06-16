/* func_0202b0ac: g = *global; k = func_0202b060(a0); return g->f4 + g->f8[k*2].
 * (g->f8 is an int table, indexed by the call result doubled.) */
extern int *data_0219a85c;
extern int func_0202b060(int);
int func_0202b0ac(int a0){
    int *g = data_0219a85c;
    int k = func_0202b060(a0);
    int *tbl = (int *)g[2];
    return g[1] + tbl[k * 2];
}
