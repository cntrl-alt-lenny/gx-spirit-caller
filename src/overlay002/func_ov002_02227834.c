typedef unsigned short u16;
typedef unsigned char u8;
struct Self { u16 id; u16 side:1; u16 rest:15; char pad[8]; u16 mode; };
struct node { char pad[8]; u16 arr8[5]; u16 f18; };
struct Slot { u16 side:1; u16 kind:4; u16 number:9; u16 state:2; };
struct Node { char pad[6]; struct { u16 lo:8; u16 hi:8; } count; struct Slot slots[5]; u16 start; };
struct Record { unsigned card:13; unsigned bit:1; unsigned pad:8; unsigned value:8; unsigned pad2:2; };
struct State { char pad[0x5a8]; int state, slot, flag; };
struct Player { int pad, side; };
extern struct State data_ov002_022ce288;
extern struct Player data_ov002_022cd73c;
extern char data_ov002_022cf16c[];
extern int func_ov002_021b0c04(void *self, int arg1);
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021bc6c4(int arg0);
extern int func_ov002_021bd030(int self);
/* The original supplies only r0 to the four-argument thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, u16 arg4);
extern int func_ov002_021d5d58(int, int, int, int);
extern int func_ov002_021ded54(int arg0, int arg1, int arg2, int arg3, int arg4);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, unsigned e);
int func_ov002_02227834(struct Self *self) {
    int pair, a, b, c, d;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        switch (self->mode) {
        case 1:
        case 3:
            if (func_ov002_0223df38((struct Node *)self, 0, 0) != 0 &&
                func_ov002_0223df38((struct Node *)self, 1, 0) != 0) {
                pair = func_ov002_0223de94((struct node *)self, 0);
                a = (u8)pair;
                b = ((int)(u16)pair >> 8) & 0xff;
                pair = func_ov002_0223de94((struct node *)self, 1);
                c = (u8)pair;
                d = ((int)(u16)pair >> 8) & 0xff;
                self->mode = 1;
                if (func_ov002_0225764c((int)self, a, b) == 0) return 0;
                self->mode = 3;
                if (func_ov002_0225764c((int)self, c, d) == 0) return 0;
                data_ov002_022ce288.flag = func_ov002_021b3ecc(a, b, 0xfb6);
                data_ov002_022ce288.slot = func_ov002_021bd030(self->side);
                if (data_ov002_022ce288.slot >= 0) {
                    func_ov002_021ded54((int)self, a, b, a, data_ov002_022ce288.slot);
                    func_ov002_021d5d58(self->side, (u16)((u8)a | ((u8)data_ov002_022ce288.slot << 8)), (u16)((u8)c | ((u8)d << 8)), 11);
                    if (self->side == data_ov002_022cd73c.side) func_ov002_021b0c04((void *)0x30, 1);
                    return 0x7f;
                }
            }
            break;
        case 2:
            if (func_ov002_0223df38((struct Node *)self, 0, 0) != 0) {
                pair = func_ov002_0223de94((struct node *)self, 0);
                a = (u8)pair;
                b = ((int)(u16)pair >> 8) & 0xff;
                if (func_ov002_0225764c((int)self, a, b) != 0) {
                    data_ov002_022ce288.flag = func_ov002_021b3ecc(a, b, 0xfb6);
                    data_ov002_022ce288.slot = func_ov002_021bc6c4(self->side);
                    if (data_ov002_022ce288.slot >= 0 && func_ov002_021ca2b8(self->side) != 0) {
                        func_ov002_0227ac64(self->side, (struct Record *)(data_ov002_022cf16c + (a & 1) * 0x868 + 0x30 + b * 20), 1, 0, 0);
                        return 0x7f;
                    }
                }
            }
            break;
        }
        return 0;
    case 0x7f:
        if (data_ov002_022ce288.flag != 0) func_ov002_021d59cc(self->side, data_ov002_022ce288.slot, 0xfb6, 2, 0);
        return 0;
    }
    return 0;
}


