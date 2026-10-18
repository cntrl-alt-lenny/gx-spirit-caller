typedef unsigned short u16;
typedef unsigned char u8;

struct NodeA { u16 f0; u16 side:1; u16 rest:15; u16 f4; u16 cnt:8; u16 hi:8; };
struct Tbl { u16 w:13; u16 x:3; u16 pad; };

extern struct Tbl data_ov002_022d0250[];
extern int data_ov002_022cd524[];
extern int func_ov002_0223de94(void *node, int idx);
extern int func_ov002_0223def4(void *node, int idx);
extern unsigned int func_0202b878(int id);

int func_ov002_0228a6e0(struct NodeA *a, struct NodeA *b) {
    int i;
    if (!b)
        return 0;
    if (b->side == a->side)
        return 0;
    for (i = 0; i < b->cnt; i++) {
        int v = func_ov002_0223de94(b, i);
        u16 w = v;
        int hi = (w >> 8) & 0xff;
        if ((v & 0xff) != a->side && hi == 0xe) {
            int r = func_ov002_0223def4(b, i);
            if (func_0202b878(data_ov002_022d0250[r].w) == 0x16) {
                data_ov002_022cd524[4] = r;
                return 1;
            }
        }
    }
    return 0;
}
