typedef unsigned short u16;
typedef unsigned char u8;
struct Entry { u16 id; u16 player:1; u16 index:5; u16 type:6; u16 rest:4; };
struct node;
struct Node;
typedef struct { u16 f_0; u16 f_2; } Self02210104;
extern int func_ov002_021bd030(int self);
extern int func_ov002_021c1a2c(int, int, int);
extern int func_ov002_021c1d28(int a, int b, int c);
/* The original leaves the fourth, unused argument unspecified. */
extern int func_ov002_021d5d48();
extern void func_ov002_021d7054(u16, u16);
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_02210104(Self02210104 *self, int unused1);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern void func_ov002_0226b11c(int unused0, int unused1);
int func_ov002_02231250(struct Entry *self, int unused1) {
    int a, b, slot;
    int pair;
    if (self->type == 2) return func_ov002_02210104((Self02210104 *)self, unused1);
    if (func_ov002_0223df38((struct Node *)self, 0, 0)) {
        pair = func_ov002_0223de94((struct node *)self, 0);
        a = (u8)pair;
        b = ((int)(u16)pair >> 8) & 0xff;
        if (func_ov002_0225764c((int)self, a, b)) {
            slot = func_ov002_021bd030(self->player);
            if (slot >= 0) {
                u8 s = slot;
                func_ov002_021d7054((u16)((u8)self->player | ((u8)self->index << 8)), (u16)((u8)self->player | (s << 8)));
                func_ov002_021d5d48(self->player, (u16)((u8)self->player | (s << 8)), (u16)((u8)a | ((u8)b << 8)));
                if (a != self->player) {
                    if (func_ov002_021c1d28(a, b, a != self->player) == 0) {
                        if (func_ov002_021c1a2c(a, b, self->id)) func_ov002_0226b11c(a, b);
                    }
                }
            } else {
                func_ov002_021de480(self->player, self->index, 0, self->id);
            }
        }
    }
    return 0;
}

