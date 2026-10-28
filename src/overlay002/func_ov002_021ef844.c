typedef unsigned short u16;
struct Ov002Self {
    u16 f0;
    u16 b0:1;
    u16 idx:5;
    u16 rest:10;
    char pad4[6];
    u16 f_a;
};
struct Slot { unsigned int id:13; unsigned int rest:19; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021e7748(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021b33b0(int a, int b, int player, int idx);
extern int func_ov002_021c23ac(int player, int index);
typedef int (*Callback02257888)(void *self, int player, int idx);
extern int func_ov002_02257888(void *self, Callback02257888 fn, int target);
int func_ov002_021ef844(struct Ov002Self *self, int player, int idx)
{
    if (self->f_a != 0)
        return func_ov002_021e7748(self, player, idx);
    if (player != self->b0) return 0;
    if (idx < 5) return 0;
    if (((struct Slot *)(data_ov002_022cf16c + (player & 1)*0x868 + idx*0x14 + 0x30))->id == 0) return 0;
    if (func_ov002_021b33b0(player, idx, self->b0, self->idx) == 0) return 0;
    if (func_ov002_021c23ac(player, idx) == 0) return 0;
    return func_ov002_02257888(self, (Callback02257888)func_ov002_021e7748, (u16)((unsigned char)player | ((unsigned char)idx << 8))) != 0;
}
