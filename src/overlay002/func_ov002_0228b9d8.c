typedef unsigned short u16;
typedef unsigned char u8;
struct node { char _pad[8]; u16 arr8[5]; u16 f18; };
typedef struct { u16 id; u16 side:1; u16 rest:15; u16 pad4; u16 count:8; u16 rest6:8; } Obj;
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_022575c8(int a0, int a1, int a2);
/* This caller supplies only r0 and r1; the thunk definition has four parameters. */
extern int func_ov002_021c84e0();
extern int func_ov002_022536e8(int self, int arg1, int arg2);
extern int func_ov002_021bcf00(int a);
int func_ov002_0228b9d8(Obj *self, Obj *other)
{
    int i;
    int side, slot;
    int pair;
    if (other == 0) return 0;
    if (other->side == self->side) return 0;
    for (i = 0; i < other->count; i++) {
        pair = func_ov002_0223de94((struct node *)other, i);
        side = (u8)pair;
        slot = (u8)((u16)pair >> 8);
        if (side == self->side && slot <= 4 && func_ov002_022575c8((int)self, side, slot) != 0) {
            switch (self->id) {
            case 0x1768:
                if (func_ov002_022536e8(self->side, self->id, func_ov002_021c84e0(side, slot) + 3) == 0) return 0;
                break;
            case 0x1a98:
                if (func_ov002_022536e8(self->side, self->id, func_ov002_021c84e0(side, slot)) == 0) return 0;
                break;
            case 0x1a9a:
                if (func_ov002_021bcf00(1 - self->side) == 0) return 0;
                break;
            }
            return 1;
        }
    }
    return 0;
}

