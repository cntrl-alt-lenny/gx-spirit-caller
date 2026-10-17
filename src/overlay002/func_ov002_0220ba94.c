struct g3f4 { int f0; int f4; int f8; char _a[20]; int f32; };
extern struct g3f4 data_ov002_022cd3f4;
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c84e0(int a, int b);

int func_ov002_0220ba94(void) {
    int self;
    int idx;
    if (data_ov002_022cd3f4.f8 != 0) {
        return 0;
    }
    self = data_ov002_022cd3f4.f4;
    idx = data_ov002_022cd3f4.f32;
    if (*(unsigned short *)(data_ov002_022cf1a4 + (self & 1) * 0x868 + idx * 20) == 0) {
        return 0;
    }
    return func_ov002_021c84e0(self, idx) <= 3;
}
