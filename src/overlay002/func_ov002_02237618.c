struct arg { unsigned short a; unsigned short b0 : 1; unsigned short b1 : 15; };
struct bf { unsigned int lo : 13; unsigned int b : 1; unsigned int m : 8; unsigned int hi : 8; unsigned int z : 2; };
struct ent2 { char _a[0x10]; unsigned cnt; char _c[0x260 - 0x14]; struct bf v[3]; char _b[0x868 - 0x26c]; };

extern struct ent2 data_ov002_022cf16c[];

extern int func_0202e234(int a);
extern int func_ov002_021ca5bc(int a);
extern void func_ov002_021df818(struct arg *p, int b, int c);
extern int func_ov002_021e13f4();
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();

int func_ov002_02237618(struct arg *p) {
    int i;
    int n;
    func_ov002_021e2b3c();
    func_ov002_021e13f4(p->b0, 3, 0);
    n = 0;
    for (i = 0; i < (data_ov002_022cf16c[p->b0 & 1].cnt >= 3 ? 3 : data_ov002_022cf16c[p->b0 & 1].cnt); i++) {
        if (func_0202e234(data_ov002_022cf16c[p->b0 & 1].v[i].lo) == 0) {
            struct bf *e = &data_ov002_022cf16c[p->b0 & 1].v[i];
            if (func_ov002_021ca5bc(e->hi * 2 + e->b) != 0) n++;
        }
    }
    func_ov002_021df818(p, p->b0, n * 1000);
    func_ov002_021e2c5c();
    return 0;
}
