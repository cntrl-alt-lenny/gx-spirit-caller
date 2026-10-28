struct Self { unsigned short f0; unsigned short player:1; unsigned short slot:5; unsigned short rest:10; };
extern int func_ov002_021b9bd4(int player, int idx);
/* The original passes only r0 to this forwarding thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern int func_ov002_021bc8c8(int self, int player, int slot);
extern int func_ov002_021ff2b8(int unused_a, int b);
extern int func_ov002_021bc288(int player, int slot);
int func_ov002_02209268(struct Self *self) {
    int limit = func_ov002_021b9bd4(self->player, self->slot);
    int value;
    if (limit == 0) return 0;
    if (func_ov002_021ca2b8(self->player) == 0) return 0;
    if (func_ov002_021ca3f0(self->player, 0x1813) == 0) return 0;
    if (func_ov002_021bc8c8(self->player, self->player, self->slot) == 0) return 0;
    value = func_ov002_021ff2b8((int)self, self->player);
    return limit <= value + func_ov002_021bc288(self->player, self->slot);
}

