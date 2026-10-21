typedef unsigned short u16;
typedef unsigned char u8;
struct Self { u16 id; u16 side:1; u16 rest:15; };
struct node { char pad[8]; u16 arr8[5]; u16 f18; };
struct Slot { u16 side:1; u16 kind:4; u16 number:9; u16 state:2; };
struct Node { char pad[6]; struct { u16 lo:8; u16 hi:8; } count; struct Slot slots[5]; u16 start; };
struct State { char pad[0x5a8]; int state, slot; };
struct Card { int v[11]; };
struct Command { unsigned id:13; unsigned side:1; unsigned rest:18; };
extern struct State data_ov002_022ce288;
extern int func_ov002_021bc618(int);
extern int func_ov002_021bc6c4(int);
extern void func_ov002_021c4c9c(int, int, struct Card *);
/* Original caller supplies only r0 to the four-argument thunk. */
extern int func_ov002_021ca2b8();
/* Original caller supplies two arguments to the constant-return stub. */
extern int func_ov002_021ca2c8(int, int);
extern int func_ov002_021ca2d0(int, int);
extern int func_ov002_021d59cc(int, int, int, int, u16);
extern u16 func_ov002_0223de94(struct node *, int);
extern int func_ov002_0223df38(struct Node *, int, int *);
extern int func_ov002_0225764c(int, int, int);
extern int func_ov002_0227adb8(int, int, int, int);
int func_ov002_022275b0(struct Self *self) {
    switch (data_ov002_022ce288.state) {
    case 0x80: {
        int pair, side, index;
        struct Card card;

        if (func_ov002_021bc618(self->side) == 0) return 0;
        if (func_ov002_021ca2b8(self->side) == 0) return 0;
        if (func_ov002_0223df38((struct Node *)self, 0, 0) != 0) {
            pair = func_ov002_0223de94((struct node *)self, 0);
            side = (u8)pair;
            index = ((int)(u16)pair >> 8) & 0xff;
            if (func_ov002_0225764c((int)self, side, index) != 0) {
                func_ov002_021c4c9c(side, index, &card);
                if (func_ov002_021ca2d0(self->side, card.v[2]) != 0 &&
                    func_ov002_021ca2c8(self->side, card.v[1]) != 0) {
                    struct Command cmd = {0};
                    cmd.id = 0x1608;
                    cmd.side = self->side;
                    data_ov002_022ce288.slot = func_ov002_021bc6c4(self->side);
                    func_ov002_0227adb8(self->side, (int)&cmd, 1, (self->id << 16) | 1);
                    return 0x7f;
                }
            }
        }
        break;
    }
    case 0x7f: {
        struct Card card;
        int pair, val;
        pair = func_ov002_0223de94((struct node *)self, 0);
        func_ov002_021c4c9c((u8)pair, ((int)(u16)pair >> 8) & 0xff, &card);
        func_ov002_021d59cc(self->side, data_ov002_022ce288.slot, 0x1608, 5, (u16)((u8)((u8)(card.v[2] & 15) | ((u8)(card.v[4] & 15) << 4)) | ((u8)card.v[1] << 8)));
        val = card.v[5];
        if (val > 0xffff) val = 0xffff;
        func_ov002_021d59cc(self->side, data_ov002_022ce288.slot, 0x1608, 5, (u16)val);
        val = card.v[6];
        if (val > 0xffff) val = 0xffff;
        func_ov002_021d59cc(self->side, data_ov002_022ce288.slot, 0x1608, 5, (u16)val);
        break;
    }
    }
    return 0;
}

