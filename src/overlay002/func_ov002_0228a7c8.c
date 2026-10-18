typedef unsigned short u16;
typedef unsigned char u8;
typedef unsigned int u32;

struct Node {
    u16 f0;
    u16 side : 1;
    u16 rest : 15;
    u16 f4;
    u16 cnt : 8;
    u16 cnthi : 8;
};

struct Glob {
    u32 f0, f4, f8, fc;
    u32 f10;
};

extern struct Glob data_ov002_022cd524;
extern int func_ov002_0223de94(void *node, int idx);
extern u32 func_ov002_0223def4(void *node, int idx);

int func_ov002_0228a7c8(struct Node *a, struct Node *b)
{
    int i;

    if (!b)
        return 0;
    if (b->side == a->side)
        return 0;
    for (i = 0; i < b->cnt; i++) {
        int r = func_ov002_0223de94(b, i);
        u16 v = r;
        int type = (v >> 8) & 0xff;
        if ((r & 0xff) != a->side && type == 0xe) {
            data_ov002_022cd524.f10 = func_ov002_0223def4(b, i);
            return 1;
        }
    }
    return 0;
}
