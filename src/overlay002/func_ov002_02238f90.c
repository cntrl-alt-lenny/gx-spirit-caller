typedef unsigned short u16;
struct Self { u16 id; u16 player:1; u16 row:5; u16 pad:10; u16 pad2:6; u16 field:9; u16 pad3:1; };
struct Row { unsigned id:13; unsigned flag:1; unsigned pad:8; unsigned value:8; unsigned rest:2; char tail[16]; };
struct node; struct Node;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern u16 func_ov002_0223de94(struct node *, int);
extern int func_ov002_0223df38(struct Node *, int, int *);
extern int func_ov002_0225764c(int, int, int);
extern int func_0202e2f8(int);
extern int func_ov002_021b9ecc(int, int);
extern void func_ov002_021d5b80(int, int, int, int);
extern int func_ov002_021d90c0(int, int, int);
extern int func_ov002_021d59cc(int, int, int, int, u16);
int func_ov002_02238f90(struct Self *self) {
    int player = self->player;
    int row = self->row;
    int poff = (player & 1) * 0x868;
    int roff = row * 0x14;
    struct Row *entry = (struct Row *)(data_ov002_022cf16c + poff + 0x30);
    int value;
    int side;
    int slot;
    if (self->field != entry[row].value * 2 + entry[row].flag) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + poff + roff) == 0) return 0;
    if (func_ov002_0223df38((struct Node *)self, 0, 0) != 0) {
        value = func_ov002_0223de94((struct node *)self, 0);
        side = (unsigned char)value;
        slot = (unsigned char)((u16)value >> 8);
        if (func_ov002_0225764c((int)self, side, slot) != 0) {
            struct Row *other = (struct Row *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30);
            if (func_0202e2f8(other[slot].id) == 0 && self->id != func_ov002_021b9ecc(side, slot)) {
                func_ov002_021d5b80(self->player, self->row, 0xfb6, 1);
                func_ov002_021d90c0(self->player, self->row, 0);
                value = other[slot].id;
                if (self->id == value) value = func_ov002_021b9ecc(side, slot);
                func_ov002_021d59cc(self->player, self->row, self->id, 2, (u16)value);
            }
        }
    }
    return 0;
}
