extern int func_02093714(void);
extern void func_02091680(int param0);
extern int data_0219ee3c;
extern int data_0219ec04;
extern int data_0219ec00;

int func_0206e100(void) {
    int v = data_0219ee3c;
    if (v != 0) {
        goto check_ece0;
    }
    if ((data_0219ec04 & 3) != 1) {
        goto done;
    }
    if (func_02093714() == 0x12) {
        goto done;
    }
    func_02091680(0xa);
    goto done;

check_ece0:
    if (data_0219ec00 == 0) {
        data_0219ec00 = v;
    }

done:
    return data_0219ee3c;
}
