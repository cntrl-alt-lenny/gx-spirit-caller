typedef unsigned short u16;
typedef unsigned char u8;
struct Node;
struct node;
struct Ov002Self { u16 id; u16 side:1; u16 rest:15; };
struct Row { unsigned id:13; unsigned rest:19; u16 a; u16 gate; u16 active; u16 tail[5]; };
struct SideRow { char prefix[0x30]; struct Row rows[5]; };
extern char data_ov002_022cf16c[];
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021d5a08(struct Ov002Self *arg0, int arg1, int arg2, int arg3, u16 arg4, u16 arg5);
/* This caller supplies only r0 and r1 to the passthrough thunk. */
extern int func_ov002_021c8940();
int func_ov002_0222f96c(struct Ov002Self *self) {
    int side, i, slot;
    int pair;
    struct SideRow *p;
    if (func_ov002_0223df38((struct Node *)self, 0, 0) != 0) {
        pair = func_ov002_0223de94((struct node *)self, 0);
        side = (u8)pair;
        slot = (u8)((int)(u16)pair >> 8);
        if (func_ov002_0225764c((int)self, side, slot) != 0) {
            func_ov002_021d5a08(self, side, slot, self->id, 2, 1);
            for (i = 0; i <= 4; i++) {
                if (i != slot) {
                    p = (struct SideRow *)(data_ov002_022cf16c + (self->side & 1) * 0x868);
                    if (p->rows[i].id != 0 && p->rows[i].active != 0 && p->rows[i].gate == 0) {
                        if (func_ov002_021c8940(self->side, i) == 0x12) {
                            func_ov002_021d5a08(self, self->side, i, self->id, 2, 0);
                        }
                    }
                }
            }
        }
    }
    return 0;
}



