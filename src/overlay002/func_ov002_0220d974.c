typedef unsigned int u32;
struct Input { unsigned short pad; unsigned short side:1, idx:5, rest:10; };
struct State { int side, idx, pad, value; int rest[10]; };
struct Slot { u32 pad0:13, bit:1, pad1:8, field:8, pad2:2; int rest[4]; };
struct Table { char pad[0x30]; struct Slot slots[1]; };
extern char data_ov002_022d016c[];
extern struct State data_ov002_022cd420[];
extern int data_ov002_022cd3f4[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021b3618(int player, int idx);
int func_ov002_0220d974(struct Input *p) {
    int side = *(int *)(data_ov002_022d016c + 0xcec);
    struct State *a = &data_ov002_022cd420[side];
    struct State *b = &data_ov002_022cd420[1-side];
    int id = func_ov002_021b3618(p->side, p->idx);
    if (data_ov002_022cd3f4[2]) return 0;
    if (id != (unsigned short)((unsigned char)a->side | ((unsigned char)a->idx << 8))) {
        struct Slot *s = &((struct Table *)(data_ov002_022cf16c + (a->side & 1) * 0x868))->slots[a->idx];
        if (a->value == s->field * 2 + s->bit) return 1;
    }
    if (id != (unsigned short)((unsigned char)b->side | ((unsigned char)b->idx << 8))) {
        struct Slot *s = &((struct Table *)(data_ov002_022cf16c + (b->side & 1) * 0x868))->slots[b->idx];
        if (b->value == s->field * 2 + s->bit) return 1;
    }
    return 0;
}
