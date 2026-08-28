extern int func_0209db98(void);
extern int func_020927e4(int p, int k);
extern int *data_021a8c4c;

int func_0209db3c(void) {
    int r = func_0209db98();
    if (r != 0) {
        return r;
    }
    func_020927e4(data_021a8c4c[1], 2);
    unsigned short v = *(unsigned short *)data_021a8c4c[1];
    return (v <= 1) ? 3 : 0;
}
