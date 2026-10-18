struct ce288 { char _a[1448]; int state; int cnt; };
struct arg { unsigned short a; unsigned short b0 : 1; unsigned short b1 : 15; };
struct ent { int w0; char _a[0x864]; };
struct bf { unsigned int lo : 13; unsigned int hi : 19; };
struct ent2 { char _a[0x3a0]; struct bf v[1]; char _b[0x868 - 0x3a4]; };

extern struct ce288 data_ov002_022ce288;
extern struct ent data_ov002_022cf184[];
extern struct ent2 data_ov002_022cf16c[];

extern unsigned func_ov002_021b00d0(int a);
extern void func_ov002_021e16a4(int a, int b, int c, int d);
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();

int func_ov002_02236728(struct arg *p) {
    unsigned r;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        func_ov002_021e2b3c();
        data_ov002_022ce288.cnt = 0;
        return 0x7f;
    case 0x7f:
        if (data_ov002_022ce288.cnt++ >= 2) return 0x7e;
        r = func_ov002_021b00d0(data_ov002_022cf184[(1 - p->b0) & 1].w0);
        {
            int i = 1 - p->b0;
            func_ov002_021e16a4(i, data_ov002_022cf16c[i & 1].v[r].lo, 0, 1);
        }
        return 0x7f;
    case 0x7e:
        func_ov002_021e2c5c();
        return 0;
    }
    return 0;
}
