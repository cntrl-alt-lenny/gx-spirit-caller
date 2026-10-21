typedef struct { unsigned short id; unsigned short side:1; unsigned short rest:15; } Card;
typedef struct { unsigned int id:13; unsigned int bit13:1; unsigned int gap:8; unsigned int value:8; unsigned int top:2; } Row;
typedef struct { char pad[4]; unsigned short low:6; unsigned short value:9; unsigned short high:1; } Info;
extern int func_ov002_021b9ecc(int, int);
extern int func_0202e234(int x);
extern int func_020310d8(int x);
extern int func_ov002_021b9e00(int arg0, int arg1);
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
int func_ov002_021f1bac(Card *card, int player, int kind) {
    int who = func_ov002_021b9ecc(player, kind);
    int off, pos;
    Row *row;
    int a, b;
    if (who == 0) return 0;
    off = (player & 1) * 0x868;
    pos = kind * 20;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + pos) == 0) return 0;
    row = (Row *)(data_ov002_022cf16c + off + 0x30 + pos);
    if (row->value * 2 + row->bit13 == ((Info *)card)->value) return 0;
    if (func_ov002_021c1ef0(card, player, kind) == 0) return 0;
    if (func_0202e234(who)) { if (kind >= 5) return 0; }
    if (!func_0202e234(who)) { if (kind < 5) return 0; }
    if ((*(unsigned int *)(data_ov002_022cf1ac + off + pos) >> 6) & 1) return 0;
    a = func_ov002_021b9e00(player, kind);
    b = func_020310d8(who);
    return a < b ? 1 : 0;
}

