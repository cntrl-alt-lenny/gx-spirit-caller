typedef unsigned short u16;
struct Self { u16 f0; u16 bit0:1; u16 rest:15; u16 f4; u16 f6; u16 f8; };
struct State { char pad[0x5a8]; int state; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021ba294(int player, int arg1);
/* The original call supplies only two arguments to the four-parameter thunk. */
extern int func_ov002_021d8288();
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_0226b054(int arg0);
int func_ov002_02224cf4(struct Self *self) {
    int index;
    int id = self->f8;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        index = func_ov002_021ba294(1 - self->bit0, id);
        if (index < 0) {
            func_ov002_021ae400(self->bit0, 0xd);
            return 0x78;
        }
        func_ov002_021d8288(1 - self->bit0, data_ov002_022cf16c + ((1 - self->bit0) & 1) * 0x868 + 0x260 + index * 4);
        return 0x64;
    case 0x78:
        func_ov002_0226b054(self->bit0);
        return 0x64;
    case 0x64:
        func_ov002_021e286c(1 - self->bit0);
        return 0;
    }
    return 0;
}
