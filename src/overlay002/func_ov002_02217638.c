typedef unsigned short u16;
typedef unsigned int u32;
extern char data_ov002_022ce288[];
extern char data_ov002_022cf178[];
extern char data_ov002_022d0e6c[];
extern void func_ov002_021d7970(int a, int b, int c);
extern void func_ov002_0226ad5c(int a, int b, int c, int d);
extern void func_ov002_0226af94(int a, int b, int c);

typedef struct {
    u16 id;
    u16 player : 1;
    u16 pad2 : 15;
    u16 f4_0 : 2;
    u16 flag : 1;
    u16 f4_3 : 13;
    u16 pad6;
    u16 f8;
} Card;

int func_ov002_02217638(Card *c) {
    int v = c->f8 & 1;
    int mode;
    if (c->flag)
        return 0;
    mode = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (mode != 0x7f) {
        if (mode == 0x80) {
            if (v == c->player) {
                func_ov002_0226ad5c(v, 1, 0, 0);
                return 0;
            }
            if (*(int *)(data_ov002_022cf178 + ((1 - c->player) & 1) * 0x868) == 0)
                return 0;
            func_ov002_0226af94(c->player, c->id, 1);
            return 0x7f;
        }
    } else {
        func_ov002_021d7970(1 - c->player, *(u16 *)(data_ov002_022d0e6c + 0xb0), 1);
        return 0;
    }
    return 0;
}
