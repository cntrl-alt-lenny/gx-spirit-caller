typedef unsigned short u16;
typedef unsigned int u32;

typedef struct Node {
    u16 f0;
    u16 f2;
    u16 f4;
    u16 f6;
} Node;

extern u16 data_ov002_022d0252[];
extern char data_ov002_022cf16c[];
extern Node data_ov002_022d0650[];

extern int func_ov002_021b99b4(int a, int b);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_02253458(int a, int b, int c);

void func_ov002_02249f68(int self, int unused, int idx)
{
    int r;
    Node *tbl;
    u32 n;
    char *base;

    n = data_ov002_022d0252[idx * 2];
    if (n == 0) {
        return;
    }
    base = data_ov002_022cf16c + (self & 1) * 0x868;
    tbl = data_ov002_022d0650;
    do {
        Node *p = &tbl[n];
        n = p->f6;
        if ((((u32)(p->f2 << 28)) >> 28) < 6 && p->f0 == 0x12e5) {
            r = func_ov002_021b99b4(self, p->f4);
            if (r >= 0) {
                if (func_ov002_021c33e4(self, self, r) != 0) {
                    if (((*(u32 *)(base + r * 4 + 0x418) << 15) >> 30) != 0) {
                        func_ov002_02253458(self, 14, r);
                    }
                }
            }
        }
    } while (n != 0);
}
