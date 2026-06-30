extern int func_02021660(int a, int b, int c);
extern int func_020216b0(int a, int b, int c);
extern int func_02034784(void);
extern int func_02034810(void);

int func_ov006_021c34c0(int *self) {
    int h;
    int r5;
    int r7;
    int r6;

    h = func_02021660(self[2], 5, 0);
    if (func_02034784()) {
        r5 = 0x8c1;
        r7 = (func_02034784() != 1) ? 1 : 0;
        r6 = func_02034810();
    } else {
        r5 = 0;
        r7 = r5;
        r6 = r5;
    }

    func_020216b0(h, 3, 0xf8);
    func_020216b0(h, 4, 8);
    func_020216b0(h, 0x11, 0);
    func_020216b0(h, 0x12, 0);
    func_020216b0(h, 0xc, r7);
    func_020216b0(h, 0xd, r6);
    func_020216b0(h, 0, r5);
    return 1;
}
