typedef unsigned short u16;
typedef unsigned int u32;
extern char data_ov002_022cf17c[];
extern int func_ov002_021ca2b8(int a);
extern int func_ov002_0223f6c4(void *p);
extern int func_ov002_022536e8(int a, int b, int c);

typedef struct {
    u16 id;
    u16 player : 1;
    u16 a : 5;
    u16 type : 6;
    u16 b : 4;
    u32 pad[4];
    u32 c0 : 9;
    u32 f9 : 1;
    u32 lvl : 4;
    u32 c2 : 2;
    u32 f16 : 1;
    u32 c3 : 2;
    u32 k : 4;
    u32 c4 : 9;
} Card;

int func_ov002_0220a868(Card *c) {
    if (func_ov002_021ca2b8(c->player) == 0)
        return 0;
    if (*(int *)(data_ov002_022cf17c + (c->player & 1) * 0x868) == 0) {
        if (func_ov002_022536e8(c->player, c->id, func_ov002_0223f6c4(c)) == 0)
            return 0;
    }
    if (c->type == 0x16 && c->f9 == c->player && c->lvl <= 4 && c->f16
        && c->k == 0xe)
        return 1;
    return 0;
}
