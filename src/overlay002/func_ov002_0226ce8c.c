typedef struct {
    char pad0[0xd44];
    unsigned int mask;
    char pad1[0xd9c - 0xd48];
    int state;
} Data;

typedef struct {
    char pad[0xb0];
    unsigned short a;
    unsigned short b;
} Out;

extern Data data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern Out data_ov002_022d0e6c;
extern unsigned int func_ov002_0228300c(int a, int b, int c);
extern void func_ov002_021ae60c(int a, int b, int c);

int func_ov002_0226ce8c(int idx, int unused, int p) {
    unsigned short v = p;
    int lo = p & 0xff;
    int hi = (v >> 8) & 0xff;
    int n;
    unsigned int m;

    switch (data_ov002_022d016c.state) {
    case 0:
        if (data_ov002_022cd744[idx] == 1) {
            data_ov002_022d016c.mask = func_ov002_0228300c(idx, unused, p);
        } else {
            func_ov002_021ae60c(0xf2, lo, hi);
        }
        data_ov002_022d016c.state++;
        return 0;
    case 1:
        m = data_ov002_022d016c.mask;
        n = 1;
        if (!(m & 2)) {
            do {
                n++;
            } while (!(m & (1 << n)));
        }
        data_ov002_022d0e6c.a = m;
        data_ov002_022d0e6c.b = n;
        return 1;
    default:
        return 1;
    }
}
