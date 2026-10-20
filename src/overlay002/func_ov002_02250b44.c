extern char data_ov002_022cf16c[];
extern unsigned int data_ov002_022cf178[];
extern unsigned int data_ov002_022cf17c[];
extern unsigned int data_ov002_022cf180[];
extern int func_0202df78(int, int);
extern int func_ov002_021bae7c(int, int, int);
extern int func_ov002_021bb068(int);
extern int func_ov002_021c33e4(int, int, int);
extern int func_ov002_021ca440(int, int);
extern void func_ov002_02253458(int, int, int);
struct Entry { unsigned int id:13; unsigned int rest:19; };
void func_ov002_02250b44(int player, int unused, int card) {
    int off = (player & 1) * 0x868;
    unsigned int i = 0;
    if (*(unsigned int *)((char *)data_ov002_022cf17c + off) > i) {
        struct Entry *e = (struct Entry *)(data_ov002_022cf16c + off + 0x260);
        char *base = data_ov002_022cf16c + off;
        do {
            if (func_0202df78(e->id, card) != 0 && func_ov002_021ca440(player, card) != 0)
                func_ov002_02253458(player, 13, i);
            i++;
            e++;
        } while (i < *(unsigned int *)(base + 0x10));
    }
    if (func_ov002_021bb068(0x159d) == 0 || func_ov002_021bae7c(player, 0x158b, -1) != 0) {
        i = 0;
        if (*(unsigned int *)((char *)data_ov002_022cf180 + off) > i) {
            struct Entry *e = (struct Entry *)(data_ov002_022cf16c + off + 0x418);
            char *base = data_ov002_022cf16c + off;
            do {
                if (func_0202df78(e->id, card) != 0 && func_ov002_021c33e4(player, player, i) != 0)
                    func_ov002_02253458(player, 14, i);
                i++;
                e++;
            } while (i < *(unsigned int *)(base + 0x14));
        }
    }
    i = 0;
    if (*(unsigned int *)((char *)data_ov002_022cf178 + off) > i) {
        struct Entry *e = (struct Entry *)(data_ov002_022cf16c + off + 0x120);
        char *base = data_ov002_022cf16c + off;
        do {
            if (func_0202df78(e->id, card) != 0 && func_ov002_021ca440(player, card) != 0)
                func_ov002_02253458(player, 11, i);
            i++;
            e++;
        } while (i < *(unsigned int *)(base + 0xc));
    }
}


