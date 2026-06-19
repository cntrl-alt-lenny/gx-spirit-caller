/* func_ov002_0220c340: C-39 — guard on a global word == 3, then
 * return helper(bit0, 0xb, f0) != 0. */
typedef unsigned short u16;
struct S0220c430 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022d008c[];
extern int func_ov002_021b3dec(int bit0, int k, u16 f0);
int func_ov002_0220c340(struct S0220c430 *self) {
    if (*(int *)(data_ov002_022d008c + 0xcf8) != 3) return 0;
    return func_ov002_021b3dec(self->bit0, 0xb, self->f0) != 0;
}
