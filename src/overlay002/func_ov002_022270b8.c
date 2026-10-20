typedef unsigned short u16;
typedef unsigned char u8;
struct node { char pad[8]; u16 arr8[5]; u16 f18; };
struct Slot { u16 side:1; u16 kind:4; u16 number:9; u16 state:2; };
struct Node { char pad[6]; struct { u16 lo:8; u16 hi:8; } count; struct Slot slots[5]; u16 start; };
typedef struct { u16 w0; u16 bit0:1; u16 pad1:13; u16 bit14:1; u16 pad15:1; } S021ff3bc;
struct Self { u16 f0; u16 bit0:1; u16 rest:15; u16 pad[2]; u16 f8; u16 fA; };
struct State { char pad[0x5a8]; int state; int slot; int flag; };
struct Row { unsigned id:13; unsigned rest:19; char tail[16]; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern u16 func_ov002_0223de94(struct node *, int);
extern int func_ov002_0223df38(struct Node *, int, int *);
extern int func_ov002_0225764c(int, int, int);
extern u16 func_ov002_021b39c4(int, int, int);
extern int func_ov002_021ff3bc(S021ff3bc *, int);
extern int func_ov002_021b3ecc(int, int, int);
extern int func_ov002_021bc6c4(int);
extern int func_ov002_0227adb8(int, int, int, int);
extern int func_ov002_021d59cc(int, int, int, int, u16);
extern void func_ov002_021d479c(u16, u16, u16, u16);
extern void func_ov002_021e2b3c(int);
/* The original leaves r0 unspecified at this no-input countdown call. */
extern void func_ov002_021e2c5c();
int func_ov002_022270b8(struct Self *self, int arg) {
    int pair = func_ov002_0223de94((struct node *)self, 0);
    int side = (u8)pair;
    int index = ((int)(u16)pair >> 8) & 0xff;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_0223df38((struct Node *)self, 0, 0) == 0) return 0;
        self->fA = 0;
        func_ov002_021e2b3c(0);
        return 0x7f;
    case 0x7f:
        if (func_ov002_0225764c((int)self, side, index) != 0) {
            pair = func_ov002_021b39c4(side, index, 0);
            side = (u8)pair;
            index = ((int)(u16)pair >> 8) & 0xff;
            if (func_ov002_021ff3bc((S021ff3bc *)self, arg) != 0) {
                data_ov002_022ce288.flag = func_ov002_021b3ecc(side, index, 0xfb6);
                data_ov002_022ce288.slot = func_ov002_021bc6c4(self->bit0);
                func_ov002_0227adb8(side, (int)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30 + index * 20), 1, 0);
                return 0x7e;
            }
        }
        return 0x7d;
    case 0x7e:
        if (data_ov002_022ce288.flag != 0)
            func_ov002_021d59cc(self->bit0, data_ov002_022ce288.slot, 0xfb6, 2, 0);
        return 0x7f;
    case 0x7d:
        if (((struct Row *)(data_ov002_022cf16c + (side & 1) * 0x868 + index * 20 + 0x30))->id != 0)
            func_ov002_021d479c((u16)((side ? 0x8000 : 0) | 0x1b), (u16)index, 0, 0);
        func_ov002_021e2c5c();
        return 0;
    default: return 0;
    }
}


