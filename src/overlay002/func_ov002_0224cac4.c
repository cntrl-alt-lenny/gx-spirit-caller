typedef unsigned int u32;
struct Card { u32 id:13; u32 rest:19; };
extern int func_0202df78(int id, int other);
extern int func_ov002_021bae7c(int player, int id, int except);
extern int func_ov002_021bb068(int id);
extern void func_ov002_02253458(int player, int kind, int idx);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern char data_ov002_022cf180[];
void func_ov002_0224cac4(int player, int id) {
    u32 i;
    int off;
    int match;
    if (id == 0x1629) match = 0x1377;
    off = (player & 1) * 0x868;
    i = 0;
    if (*(u32 *)(data_ov002_022cf17c + off) > i) {
        struct Card *p;
        char *base = data_ov002_022cf16c + off;
        p = (struct Card *)(base + 0x260);
        do {
            if (func_0202df78(p->id, match))
                func_ov002_02253458(player, 13, i);
            i++;
            p++;
        } while (i < *(u32 *)(base + 0x10));
    }
    if (func_ov002_021bb068(0x159d)) {
        if (!func_ov002_021bae7c(player, 0x158b, -1)) return;
    }
    i = 0;
    if (*(u32 *)(data_ov002_022cf180 + off) > i) {
        struct Card *p;
        char *base = data_ov002_022cf16c + off;
        p = (struct Card *)(base + 0x418);
        do {
            if (func_0202df78(p->id, match))
                func_ov002_02253458(player, 14, i);
            i++;
            p++;
        } while (i < *(u32 *)(base + 0x14));
    }
}

