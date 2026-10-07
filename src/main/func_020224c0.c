extern int func_0202224c(int idx);
extern int func_02022270(char *base, int i);

int func_020224c0(char *base, int mode, int val) {
    int r = 0;
    switch (mode) {
    case 1:
        if (val >= 0x20) {
            r = func_02022270(base, val - 0x20);
        } else {
            r = func_0202224c(val);
        }
        break;
    case 0:
        r = val;
        break;
    }
    return r;
}
