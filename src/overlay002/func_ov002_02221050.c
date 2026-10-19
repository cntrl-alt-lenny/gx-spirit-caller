typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 13;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
} S021ff3bc;
struct Self {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short rest : 15;
    unsigned short w4;
    unsigned short low6 : 8;
    unsigned short count : 8;
    unsigned short ids[1];
};
struct State { char pad[0x5a8]; int state; int index; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021c33e4(int player, int owner, int slot);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_02221050(struct Self *self, int unused1) {
    int slot;
    int result;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        result = func_ov002_021ff3bc((S021ff3bc *)self, unused1);
        if (result == 0) return 0;
        func_ov002_021e2b3c(result);
        data_ov002_022ce288.index = 0;
        return 0x7f;
    case 0x7f:
        if (data_ov002_022ce288.index < self->count && func_ov002_021bc618(self->bit0) != 0) {
            slot = func_ov002_021b99b4(self->bit0, self->ids[data_ov002_022ce288.index]);
            if (slot >= 0 && func_ov002_021c33e4(self->bit0, self->bit0, slot) != 0) {
                func_ov002_0227adb8(self->bit0, (int)(data_ov002_022cf16c + (self->bit0 & 1) * 0x868 + 0x418 + slot * 4), 1, self->w0 << 16);
            }
            data_ov002_022ce288.index++;
            return 0x7f;
        }
        return 0x7e;
    case 0x7e:
        func_ov002_021e2c5c((int)self);
        return 0;
    default:
        return 0;
    }
}
