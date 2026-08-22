struct F2_t {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F4_t {
    unsigned short pad : 6;
    unsigned short field9 : 9;
    unsigned short rest : 1;
};
struct Self_t {
    unsigned short f0;
    struct F2_t f2;
    struct F4_t f4;
};

extern char data_ov002_022cf16c[];

extern int func_ov002_02202680(struct Self_t *self);
extern int func_ov002_021d5a6c(int a0, int a1, int a2, int a3);
extern int func_ov002_021b99b4(int bit, int f4);
extern int func_ov002_021c33e4(int bit, int bit2, int idx);
extern void func_ov002_0227adb8(int a, int b, int c, int d);

int func_ov002_0221b4f0(struct Self_t *a0) {
    int idx;
    int bit;

    if (func_ov002_02202680(a0) == 0) {
        return 0;
    }
    func_ov002_021d5a6c(a0->f4.field9, a0->f0, 5, 0);
    idx = func_ov002_021b99b4(a0->f2.bit0, a0->f4.field9);
    if (idx < 0) {
        goto done;
    }
    bit = a0->f2.bit0;
    if (func_ov002_021c33e4(bit, bit, idx) != 0) {
        bit = a0->f2.bit0;
        func_ov002_0227adb8(bit, (bit & 1) * 0x868 + (int)data_ov002_022cf16c + 0x18 + 0x400 + (idx << 2), 1, 1);
    }
done:
    return 0;
}
