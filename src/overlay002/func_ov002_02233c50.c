typedef unsigned short u16;
typedef struct {
    u16 field0;
    u16 player : 1;
    u16 unused1 : 13;
    u16 flip : 1;
    u16 unused2 : 1;
    u16 field4;
    u16 low : 8;
    u16 high : 8;
} Self;
typedef struct {
    unsigned int field0 : 13;
    unsigned int pad13 : 1;
    unsigned int bit14 : 1;
    unsigned int pad15 : 17;
} S021b9ba0;
struct Node0223def4 { char _pad[8]; u16 arr8[5]; u16 f18; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021b9ba0(S021b9ba0 *p);
extern int func_ov002_021bc618(int arg0);
/* This caller supplies only r0; remaining thunk arguments are not set. */
extern int func_ov002_021ca2b8();
/* This caller supplies only r0-r1; remaining thunk arguments are not set. */
extern int func_ov002_021e104c();
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_02233c50(Self *self) {
    int side = self->player ^ self->flip;
    int index;
    S021b9ba0 *entry;
    func_ov002_021e104c(1 - self->player, 2);
    if (!func_ov002_021bc618(side)) return 0;
    if (!func_ov002_021ca2b8(side)) return 0;
    if (self->high == 1) {
        index = func_ov002_021b99b4(side, func_ov002_0223def4((struct Node0223def4 *)self, 0));
        if (index >= 0) {
            entry = (S021b9ba0 *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x418 + index * 4);
            if (!func_ov002_021b9ba0(entry)) return 0;
            func_ov002_0227adb8(side, (int)entry, 1, self->field0 << 16);
        }
    }
    return 0;
}

