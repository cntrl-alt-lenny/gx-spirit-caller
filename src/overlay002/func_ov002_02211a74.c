typedef unsigned short u16;
typedef struct {
    u16 id;
    u16 side:1;
    u16 pos:5;
    u16 rest2:10;
    u16 pad4:6;
    u16 index:9;
    u16 rest4:1;
    u16 pad6;
    u16 extra;
} Card;
typedef struct { unsigned int id:13; unsigned int side:1; unsigned int unused:8; unsigned int index:8; unsigned int rest:2; unsigned int tail[4]; } Obj;
typedef struct { unsigned char pad[0x30]; Obj cards[1]; unsigned char tail[0x824]; } Side;
typedef struct { u16 count; unsigned char pad[18]; } Entry;
typedef struct { Entry entries[1]; unsigned char tail[0x854]; } Counts;
extern Side data_ov002_022cf16c[];
extern Counts data_ov002_022cf1a4[];
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
int func_ov002_02211a74(Card *card)
{
    u16 index = card->index;
    u16 side = card->side;
    u16 pos = card->pos;
    int extra = 0;

    if (index != data_ov002_022cf16c[side & 1].cards[pos].index * 2 + data_ov002_022cf16c[side & 1].cards[pos].side) return 0;
    if (data_ov002_022cf1a4[side & 1].entries[pos].count == 0) return 0;
    if (card->id == 0x19a5) extra = card->extra;
    func_ov002_021d59cc(side, pos, card->id, 2, extra);
    return 0;
}




