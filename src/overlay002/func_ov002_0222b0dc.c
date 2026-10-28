typedef unsigned short u16;
typedef unsigned char u8;
typedef unsigned int u32;
struct Node0223def4 {
    u16 f0;
    u16 player:1;
    u16 rest:15;
    u16 f4;
    u16 low:8;
    u16 count:8;
    u16 arr8[5];
    u16 f18;
};
extern char data_ov002_022cf16c[];
extern int func_ov002_021bc618(int arg0);
/* This caller supplies only r0 to the four-parameter forwarding thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
extern int func_ov002_021b947c(int value);
extern int func_ov002_021c3608(int a, int b, int c);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_0222b0dc(struct Node0223def4 *self) {
    u32 result;
    int high;
    u16 index;

    int player;
    int kind;
    if (func_ov002_021bc618(self->player) == 0) return 0;
    if (func_ov002_021ca2b8(self->player) == 0) return 0;
    if (self->count == 1) {
        result = func_ov002_021b947c(func_ov002_0223def4(self, 0));
        player = (u8)result;
        high = (u16)(result >> 16);
        index = high;
        kind = (u8)((u16)result >> 8);
        if (kind == 15) {
            if (func_ov002_021c3608(self->player, player, index) != 0) {
                func_ov002_0227adb8(self->player, (int)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x5d0 + (u16)high * 4), 1, 0);
            }
        }
    }
    return 0;
}













