typedef unsigned int u32;
typedef struct { u32 id:13; u32 rest:19; } Card;
extern char data_ov002_022cf16c[];
extern u32 data_ov002_022cf178[];
extern u32 data_ov002_022cf17c[];
extern int func_0202df78(int a, int b);
extern int func_0202f620(int a, int *out);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0224848c(int player, int kind, int arg)
{
    int ids[2] = {0, 0};
    u32 i;
    u32 off;
    switch (kind) {
    case 0xfb6: ids[0] = 0x146e; break;
    case 0x10e4: ids[0] = 0xfe4; ids[1] = 0xfe5; break;
    case 0x1529: ids[0] = 0x1534; break;
    case 0x15e0: ids[0] = 0xfa7; break;
    case 0x1642: ids[0] = 0x1643; break;
    case 0x165a: ids[0] = 0x1644; break;
    case 0x167e: ids[0] = 0xfc9; break;
    case 0x1741: ids[0] = 0x173d; break;
    case 0x17af: ids[0] = 0x1788; break;
    case 0x17d1: ids[0] = 0x1822; break;
    case 0x17c5: ids[0] = 0x17c5; break;
    case 0x17c9: ids[0] = 0x17c9; break;
    case 0x17d2: ids[0] = 0x17d3; break;
    case 0x17d3: ids[0] = 0x17d4; break;
    case 0x17d5: ids[0] = 0x17d6; break;
    case 0x17d7: ids[0] = 0x17d8; break;
    case 0x17d8: ids[0] = 0x1823; break;
    case 0x17d9: ids[0] = 0x17da; break;
    case 0x17da: ids[0] = 0x17db; break;
    case 0x17f5: func_0202f620(arg, ids); break;
    case 0x1812: ids[0] = 0x1814; break;
    case 0x1814: ids[0] = 0x1816; break;
    case 0x1817: ids[0] = 0x181a; break;
    case 0x1822: ids[0] = 0x185e; break;
    case 0x185d: ids[0] = 0x185c; break;
    case 0x185e: ids[0] = 0x18af; break;
    case 0x187e: ids[0] = 0x186b; break;
    case 0x18a3: ids[0] = 0x18a4; break;
    case 0x1907: ids[0] = 0x1906; break;
    case 0x1918: ids[0] = 0x1918; break;
    case 0x19b5: ids[0] = 0x19a8; break;
    case 0x19d8:
        switch (arg) {
        case 0x1757: ids[0] = 0x19cd; break;
        case 0x191d: ids[0] = 0x19ce; break;
        }
        break;
    case 0x1a0c: ids[0] = 0x1a05; break;
    case 0x1a1a: ids[0] = 0x19f6; break;
    case 0x1a6c: ids[0] = 0x1a70; break;
    case 0x1a76: ids[0] = 0x1a70; break;
    case 0x1ad6: ids[0] = 0x1ad7; break;
    case 0x1ad7: ids[0] = 0x1ad8; break;
    case 0x1adc: ids[0] = 0x1add; break;
    case 0x1add: ids[0] = 0x1ade; break;
    }
    off = (player & 1) * 0x868;
    i = 0;
    if (i < *(u32 *)((char *)data_ov002_022cf178 + off)) {
        Card *card;
        char *base = data_ov002_022cf16c + off;
        card = (Card *)(base + 0x120);
        do {
            int id = card->id;
            if ((func_0202df78(ids[0], id) || func_0202df78(ids[1], id)) && func_ov002_021ca3f0(player, id))
                func_ov002_02253458(player, 11, i);
            i++;
            card++;
        } while (i < *(u32 *)(base + 0xc));
    }
    {
    Card *card;
    char *base;
    u32 i = 0;
    if (i < *(u32 *)((char *)data_ov002_022cf17c + off)) {
        base = data_ov002_022cf16c + off;
        card = (Card *)(base + 0x260);
        do {
            int id = card->id;
            if ((func_0202df78(ids[0], id) || func_0202df78(ids[1], id)) && func_ov002_021ca3f0(player, id))
                func_ov002_02253458(player, 13, i);
            i++;
            card++;
        } while (i < *(u32 *)(base + 0x10));
    }
}
}

