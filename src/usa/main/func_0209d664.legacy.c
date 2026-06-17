/* func_0209d664: StyleA -> dc8c() ? 0 : g->f4. */
extern int func_0209db98(void);
extern int *data_021a8c4c;
int func_0209d664(void) {
    int r = func_0209db98();
    return r != 0 ? 0 : data_021a8c4c[1];
}
