typedef struct {
    unsigned short f0;
    unsigned short f2;
    unsigned short f4;
    unsigned short f6;
    char _pad0[0x804];
    int f80c;
    int f810;
} S021d2f84;

typedef struct { char _a[4]; int f4; } G73c;

typedef union {
    int raw;
    struct {
        unsigned int lo13 : 13;
        unsigned int bit13 : 1;
        unsigned int mid : 8;
        unsigned int hi8 : 8;
        unsigned int top2 : 2;
    } bits;
} PackedVal;

extern S021d2f84 data_ov002_022ce870;
extern G73c data_ov002_022cd65c;
extern int func_ov002_0229acd0(int cmd, int a, int b, int c);
extern int func_ov002_0229c6e8(int cmd);
extern PackedVal *func_ov002_021afab0(int i);
extern void func_ov002_021b1f08(int a, int b, int c, int combined);
extern int func_ov002_021b0b24(void *self, int arg1);

void func_ov002_021d2e9c(void) {
    int bit15 = (data_ov002_022ce870.f0 & 0x8000) ? 1 : 0;
    int state = data_ov002_022ce870.f810;
    int f2 = data_ov002_022ce870.f2;
    int f4 = data_ov002_022ce870.f4;
    int f6 = data_ov002_022ce870.f6;

    switch (state) {
    case 0: goto state_0;
    case 1: goto state_1;
    default: goto state_default;
    }

state_0:
    func_ov002_0229acd0(0x41, bit15, f2, 0);
    data_ov002_022ce870.f810 = data_ov002_022ce870.f810 + 1;
    return;

state_1:
    {
        int i;
        if (func_ov002_0229c6e8(0x41) != 0) {
            return;
        }
        func_ov002_0229acd0(0x35, bit15, f4, f6);
        for (i = 0; i < f6; i++) {
            PackedVal *p1 = func_ov002_021afab0(i);
            PackedVal *p2 = func_ov002_021afab0(i);
            int combined = (int)p2->bits.hi8 * 2 + p1->bits.bit13;
            func_ov002_021b1f08(f4, 3, 0x12e5, combined);
        }
        data_ov002_022ce870.f810 = data_ov002_022ce870.f810 + 1;
        return;
    }

state_default:
    if (func_ov002_0229c6e8(0x35) != 0) {
        return;
    }
    if (bit15 == data_ov002_022cd65c.f4) {
        func_ov002_021b0b24((void *)0x23, 1);
    }
    data_ov002_022ce870.f80c = 0;
}
