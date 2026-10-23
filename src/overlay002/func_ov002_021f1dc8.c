typedef struct { unsigned short id; unsigned short side:1; unsigned short kind:5; unsigned short rest:10; } Card;
typedef struct { unsigned int id:13; unsigned int bit13:1; unsigned int gap:8; unsigned int value:8; unsigned int top:2; } Row;
typedef struct { char pad[0x30]; unsigned int id:13; unsigned int rest:19; } Subrow;
typedef struct { char pad[4]; unsigned short low:6; unsigned short value:9; unsigned short high:1; } Info;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
extern int func_ov002_021c2084(Card *card, int side, int slot, int check);
int func_ov002_021f1dc8(Card *card, int player, int kind) {
    int off = (player & 1) * 0x868;
    int pos = kind * 20;
    Row *row;
    if (((Subrow *)(data_ov002_022cf16c + off + pos))->id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + pos) != 0) return 0;
    row = (Row *)(data_ov002_022cf16c + off + 0x30 + pos);
    if (row->value * 2 + row->bit13 == ((Info *)card)->value) return 0;
    if (func_ov002_021c1ef0(card, player, kind) == 0) return 0;
    return func_ov002_021c2084(card, player, kind, 1) != 0;
}


