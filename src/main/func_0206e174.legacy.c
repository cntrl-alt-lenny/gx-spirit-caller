extern int func_02093808(void);
extern void func_02091768(int param0);
extern int data_0219ef1c;
extern int data_0219ece4;
extern int data_0219ece0;

int func_0206e174(void) {
    int v = data_0219ef1c;
    if (v != 0) {
        goto check_ece0;
    }
    if ((data_0219ece4 & 3) != 1) {
        goto done;
    }
    if (func_02093808() == 0x12) {
        goto done;
    }
    func_02091768(0xa);
    goto done;

check_ece0:
    if (data_0219ece0 == 0) {
        data_0219ece0 = v;
    }

done:
    return data_0219ef1c;
}
