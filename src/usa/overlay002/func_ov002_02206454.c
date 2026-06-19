/* func_ov002_02206454: C-39f self-preserved — if table[bit0] != 0,
 * return helper(bit0, 0xb, f0) == 0; else 0. Inverted polarity so the
 * v==0 path branches to the shared `return 0` (orig `beq`). */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf09c[];
extern int func_ov002_021b3dec(int bit0, int k, u16 f0);
int func_ov002_02206454(struct S *self) {
    int v = *(int *)(data_ov002_022cf09c + (self->bit0 & 1) * 0x868);
    if (v != 0) {
        return func_ov002_021b3dec(self->bit0, 0xb, self->f0) == 0;
    }
    return 0;
}
