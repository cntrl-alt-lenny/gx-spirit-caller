typedef unsigned short u16;
struct Obj {
    u16 id;
    u16 side:1, rest:15;
    u16 pad:2, skip:1, rest4:13;
};
struct Node { unsigned int id:13, flag:1, pad:8, sub:8, rest:2; };
struct State { char pad[0x5a8]; int state; };
struct Side { char pad[0xcec]; int side; };
struct Count { int count; char pad[0x864]; };
struct Index { char pad[0xb0]; u16 index; };
extern struct State data_ov002_022ce288;
extern struct Side data_ov002_022d016c;
extern struct Count data_ov002_022cf178[];
extern struct Index data_ov002_022d0e6c;
extern void *func_ov002_021c93f0(int player, int kind, int extra);
extern void func_ov002_021d7b44(int player, void *node, int flag);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern void func_ov002_0226af78(int arg0, int arg1);
int func_ov002_022151c0(struct Obj *p) {
    struct Node *node;
    unsigned char kind;
    if (p->skip) return 0;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (data_ov002_022cf178[(1 - p->side) & 1].count == 0) return 0;
        func_ov002_0226af78(1 - p->side, 0);
        return 0x7f;
    case 0x7f:
        node = func_ov002_021c93f0(1 - p->side, 11, data_ov002_022d0e6c.index);
        kind = (data_ov002_022d016c.side == p->side) + 6;
        func_ov002_021e276c((void *)(1 - p->side), p->id, (u16)((kind << 4) | 1), (u16)(node->sub * 2 + node->flag));
        func_ov002_021d7b44(1 - p->side, node, 0x81);
        return 0;
    }
    return 0;
}
