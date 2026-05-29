/* func_0209d758: StyleA -> dc8c() ? 0 : g->f4. */
extern int func_0209dc8c(void);
extern int *data_021a8d2c;
int func_0209d758(void) {
    int r = func_0209dc8c();
    return r != 0 ? 0 : data_021a8d2c[1];
}
