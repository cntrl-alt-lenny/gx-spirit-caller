struct State {
    unsigned short unused, a, b, packed;
    char pad[0x804];
    int active;
    int step;
};
extern struct State data_ov002_022ce950;
/* This caller supplies only r0 to these thunks; the other parameters are not set. */
extern int func_ov002_021ab864();
extern int func_ov002_021ae3f0();
extern int func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_0229c7f8(int a);
void func_ov002_021cac64(void) {
    int a = data_ov002_022ce950.a;
    int b = data_ov002_022ce950.b;
    int low = data_ov002_022ce950.packed & 0xff;
    int high = data_ov002_022ce950.packed >> 8;
    if (data_ov002_022ce950.step == 0) {
        func_ov002_021ab864(0);
        func_ov002_021ae3f0(0);
        func_ov002_0229ade0(12, a, b, (unsigned short)((unsigned char)low | ((unsigned char)high << 8)));
        data_ov002_022ce950.step++;
    }
    if (func_ov002_0229c7f8(12) == 0) {
        data_ov002_022ce950.active = 0;
    }
}

