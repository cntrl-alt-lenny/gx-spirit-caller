extern int func_0202160c(int a, int b, int c);
extern int func_0202165c(int a, int b, int c);
extern int func_02034734(void);
extern int func_020347c0(void);

int func_ov006_021c33b4(int *self) {
    int h;
    int r5;
    int r7;
    int r6;

    h = func_0202160c(self[2], 5, 0);
    if (func_02034734()) {
        r5 = 0x8c1;
        r7 = (func_02034734() != 1) ? 1 : 0;
        r6 = func_020347c0();
    } else {
        r5 = 0;
        r7 = r5;
        r6 = r5;
    }

    func_0202165c(h, 3, 0xf8);
    func_0202165c(h, 4, 8);
    func_0202165c(h, 0x11, 0);
    func_0202165c(h, 0x12, 0);
    func_0202165c(h, 0xc, r7);
    func_0202165c(h, 0xd, r6);
    func_0202165c(h, 0, r5);
    return 1;
}
