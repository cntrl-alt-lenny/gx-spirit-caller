typedef unsigned short u16;
struct Obj230c {
    u16 id;
    u16 player : 1;
    u16 idx : 5;
    u16 pad : 6;
    u16 state : 2;
    u16 rest : 2;
};
extern int func_ov002_021b9bd4(int player, int idx);
extern int func_ov002_021bae7c(int player, int code, int arg);
extern char data_ov002_022cf16c[];
int func_ov002_0229230c(struct Obj230c *self)
{
    int count;
    if (self->state == 0) return 1;
    count = func_ov002_021b9bd4(self->player, self->idx);
    if (*(int *)(data_ov002_022cf16c + ((1 - self->player) & 1) * 0x868) <= count * 1000) return 1;
    if (func_ov002_021bae7c(self->player, self->id, -1) > 1 && count >= 2) return 1;
    return 0;
}
