typedef unsigned short u16;

struct BitField2 {
    u16 bit0 : 1;
    u16 _rest : 15;
};

extern int func_ov002_0223df38(void *a, int b, int c);
extern int func_ov002_0223de94(void *a, int b);
extern int func_ov002_021c1e44(void *a, int b, int c);
extern int func_ov002_021d479c(int a, int b, int c, int d);

int func_ov002_02214fc8(void *arg0) {
    int packed;
    int byte1, byte2;
    struct BitField2 *bf;

    if (func_ov002_0223df38(arg0, 0, 0)) {
        packed = func_ov002_0223de94(arg0, 0);
        byte1 = (unsigned char)packed;
        byte2 = (unsigned char)(((unsigned short)packed) >> 8);
        if (!func_ov002_021c1e44(arg0, byte1, byte2)) {
            func_ov002_021d479c((u16)((byte1 != 0 ? 0x8000 : 0) | 0x1b), (u16)byte2, 1, 0);

            bf = (struct BitField2 *)((char *)arg0 + 2);
            func_ov002_021d479c((u16)((bf->bit0 != 0 ? 0x8000 : 0) | 0x1c), 0, 0, 0);
        }
    }
    return 0;
}
