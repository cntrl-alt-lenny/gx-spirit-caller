typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
struct node { char _pad[8]; u16 arr8[5]; u16 f18; };
typedef struct { u16 id; u16 side:1; u16 rest:15; u16 pad4; u16 count:8; u16 rest6:8; } Obj;
typedef struct { u32 id:13; u32 rest:19; char pad[16]; } Entry;
extern char data_ov002_022cf16c[];
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_0202e234(int x);
extern int func_0202e2f8(int unused0);
extern int func_ov002_021c10e8(int, int, int);
int func_ov002_0228b8c8(Obj *self, Obj *other)
{
    int i;
    int side, slot, id;
    int pair;
    if (other == 0) return 0;
    if (other->side == self->side) return 0;
    for (i = 0; i < other->count; i++) {
        pair = func_ov002_0223de94((struct node *)other, i);
        side = (u8)pair;
        slot = (u8)((u16)pair >> 8);
        if (side == self->side && slot <= 4) {
            id = ((Entry *)(data_ov002_022cf16c + (side & 1) * 0x868 + slot * 0x14 + 0x30))->id;
            if (func_0202e234(id) != 0 && func_0202e2f8(id) == 0) {
                if (func_ov002_021c10e8(side, slot, 1) == self->side) return 1;
            }
        }
    }
    return 0;
}

