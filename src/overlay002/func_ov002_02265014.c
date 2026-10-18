typedef struct {
    char pad[0xcf0];
    int count;
} Data;

extern Data data_ov002_022d016c;
extern int func_ov002_021b4120(int a, int b, int c);
extern void func_ov002_021d479c(unsigned short a, int b, int c, unsigned short d);
extern void func_ov002_021e276c(int a, int b, int c, int d);

int func_ov002_02265014(int side) {
    int i;
    int r;
    int v;

    for (i = 0; i < 2; i++) {
        r = func_ov002_021b4120(side, 0xb, 0x169c);
        if (r >= 0) {
            v = data_ov002_022d016c.count + 1 - r;
            func_ov002_021d479c((side != 0 ? 0x8000 : 0) | 0x3b, 0x169c, 1, v);
            if (v >= 0x14) {
                func_ov002_021e276c(side, 0x169c, 1, 1);
            }
        }
        side ^= 1;
    }
    return 1;
}
