typedef unsigned int u32;
struct Card { u32 id:13; u32 rest:19; };
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern int func_0202df78(int a, int b);
extern void func_ov002_02253458(int player, int kind, int idx);
extern int func_ov002_021bb068(int id);
extern int func_ov002_021bae7c(int player, int id, int except);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern char data_ov002_022cf17c[];
extern char data_ov002_022cf180[];
void func_ov002_0224c69c(int player, int card) {
    u32 i;
    int offset;
    int id;
    struct Card *p;
    char *row;
    switch (card) {
    case 0x1610: id = 0x1377; break;
    case 0x1611: id = 0xfc9; break;
    case 0x167d: id = 0x167c; break;
    case 0x1713: id = 0x16f8; break;
    case 0x195c: id = 0x1951; break;
    case 0x19b1: id = 0x19a9; break;
    }
    if (!func_ov002_021ca3f0(player, id)) return;
    offset = (player & 1) * 0x868;
    i = 0;
    if (i < *(u32 *)(data_ov002_022cf17c + offset)) {
        row = data_ov002_022cf16c + offset;
        p = (struct Card *)(row + 0x260);
        do {
            if (func_0202df78(p->id, id))
                func_ov002_02253458(player, 13, i);
            i++;
            p++;

        } while (i < *(u32 *)(row + 0x10));
    }
    if (!func_ov002_021bb068(0x159d) || func_ov002_021bae7c(player, 0x158b, -1)) {
        struct Card *q;
        char *row2;
        i = 0;
        if (i < *(u32 *)(data_ov002_022cf180 + offset)) {
            row2 = data_ov002_022cf16c + offset;
            q = (struct Card *)(row2 + 0x418);
            do {
                if (func_0202df78(q->id, id))
                    func_ov002_02253458(player, 14, i);
                i++;
            q++;
    
            } while (i < *(u32 *)(row2 + 0x14));
        }
    }
    {
    struct Card *p3;
    char *row3;
    i = 0;
    if (i < *(u32 *)(data_ov002_022cf178 + offset)) {
        row3 = data_ov002_022cf16c + offset;
        p3 = (struct Card *)(row3 + 0x120);
        do {
            if (func_0202df78(p3->id, id))
                func_ov002_02253458(player, 11, i);
            i++;
            p3++;

        } while (i < *(u32 *)(row3 + 0xc));
    }
}











}

