typedef unsigned short u16;
typedef unsigned char u8;
struct Self { u16 id; u16 side:1, slot:5, rest:10; u16 pad:6, value:9, tail:1; };
struct Slot { unsigned int id:13, flag:1, rest:8, value:8, tail:2; };
struct Node;
struct node;
extern char data_ov002_022cf16c[];
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, u16 arg4);
int func_ov002_0221c5cc(struct Self *self) {
    unsigned int slot, side;
    slot = self->slot;
    side = self->side;
    if (self->value != ((struct Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30 + slot * 20))->value * 2 + ((struct Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30 + slot * 20))->flag) return 0;
    if (func_ov002_0223df38((struct Node *)self, 0, 0) != 0) {
        unsigned int packed = func_ov002_0223de94((struct node *)self, 0);
        int lo = packed & 0xff;
        int hi = ((u16)packed >> 8) & 0xff;
        if (func_ov002_0225764c((int)self, lo, hi) != 0) {
            func_ov002_021d59cc(lo, hi, (u16)((u8)self->side | ((u8)self->slot << 8)), 6, 0);
            return 0;
        }
    }
    return 0;
}
