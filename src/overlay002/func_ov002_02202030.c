struct Self { unsigned short f0; unsigned short side : 1; };
struct State { char pad[0xcec]; int side; char pad2[8]; int mode; };
extern struct State data_ov002_022d016c;
extern char data_ov002_022cf17c[];
extern int func_ov002_021ff2b8(int unused_a, int b);
/* The original supplies only the player argument to this four-parameter thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021c9df0(int arg);
int func_ov002_02202030(struct Self *self) {
    if (data_ov002_022d016c.side == self->side) return 0;
    if (data_ov002_022d016c.mode != 3) return 0;
    if (func_ov002_021ff2b8((int)self, self->side) < 2) return 0;
    if (*(unsigned int *)(data_ov002_022cf17c + (self->side & 1) * 0x868) < 2) return 0;
    if (func_ov002_021ca2b8(self->side) == 0) return 0;
    return func_ov002_021c9df0(self->side) != 0;
}

