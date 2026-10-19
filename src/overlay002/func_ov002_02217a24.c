typedef unsigned short u16;
struct Bits0 { u16 player:1; u16 rest:15; };
struct Bits2 { u16 pad:2; u16 blocked:1; u16 rest:13; };
struct Self { u16 id; struct Bits0 side; struct Bits2 flags; u16 pad; u16 owner; };
struct State { char pad[0x5a8]; int mode; };
struct Card { unsigned int pad:13; unsigned int flag:1; unsigned int rest:18; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf178[];
extern unsigned char data_ov002_022d0e6c[];
extern struct Card *func_ov002_021c93f0(int, int, int);
extern void func_ov002_021d71e0(int, int, int);
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_0226af94(int arg0, int arg1, int arg2);
extern void func_ov002_0226afb4(int arg0, int arg1);
int func_ov002_02217a24(struct Self *self) {
    int owner = self->owner & 1;
    int side;
    int index;
    int flag;
    if (self->flags.blocked) return 0;
    switch (data_ov002_022ce288.mode) {
    case 0x80:
        side = self->side.player;
        if (owner == side) {
            if (*(int *)(data_ov002_022cf178 + (side & 1) * 0x868) == 0) return 0;
            func_ov002_0226afb4(side, self->id);
        } else {
            if (*(int *)(data_ov002_022cf178 + ((1-side) & 1) * 0x868) == 0) return 0;
            func_ov002_0226af94(side, self->id, 1);
        }
        return 0x7f;
    case 0x7f:
        index = *(u16 *)(data_ov002_022d0e6c + 0xb0);
        flag = func_ov002_021c93f0(owner, 0xb, index)->flag;
        func_ov002_021d71e0(owner, index, 1);
        func_ov002_021e286c(flag);
        return 0x64;
    default: return 0;
    }
}
