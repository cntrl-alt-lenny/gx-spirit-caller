extern int func_0209dc8c(void);
extern int func_020928cc(int p, int k);
extern int *data_021a8d2c;

int func_0209dc30(void) {
    int r = func_0209dc8c();
    if (r != 0) {
        return r;
    }
    func_020928cc(data_021a8d2c[1], 2);
    unsigned short v = *(unsigned short *)data_021a8d2c[1];
    return (v <= 1) ? 3 : 0;
}
