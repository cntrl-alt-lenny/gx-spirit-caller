typedef unsigned short u16;
typedef struct { u16 f0; u16 flag0:1; u16 field:5; u16 :10; } Card021c1e44;
typedef struct { unsigned int id:13; unsigned int side:1; unsigned int unused:8; unsigned int index:8; unsigned int rest:2; unsigned int tail[4]; } Obj;
typedef struct { unsigned char pad[0x30]; Obj cards[1]; unsigned char tail[0x824]; } Side;
typedef struct { int side; int pos; int f8; int packed; int pad[7]; int flag; int tail[2]; } Entry;
typedef struct { unsigned char pad[0xcec]; int side; } Global;
extern Side data_ov002_022cf16c[];
extern Entry data_ov002_022cd420[];
extern Global data_ov002_022d016c;
extern int func_ov002_021df130(Card021c1e44 *card, int idx, int flags);
extern int func_ov002_021de64c(int a, int b, int c, int unused3);
int func_ov002_022119bc(Card021c1e44 *card)
{
    int i;
    for (i = 0; i < 2; i++) {
        Entry *p = &data_ov002_022cd420[data_ov002_022d016c.side ^ i];
        if (p->flag != 0) {
            func_ov002_021df130(card, i, 0);
        } else {
            int side = p->side;
            int pos = p->pos;
            Obj *obj = &data_ov002_022cf16c[side & 1].cards[pos];
            if (p->packed == obj->index * 2 + obj->side)
                func_ov002_021de64c((int)card, side, pos, 0);
        }
    }
    return 0;
}
