/* func_ov002_0220bbd0: C-39f bit-0-indexed table lookup (gotcha 14).
 * 3-arg/2-arg helper keeps self+arg1 live -> index to ip/r2/r3;
 * explicit (bit0 & 1) reproduces the redundant `and #1`.
 */
typedef unsigned short u16;
struct S0220bbd0 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf288[];
extern int func_ov002_021ff400(struct S0220bbd0 *self, int arg1);
int func_ov002_0220bbd0(struct S0220bbd0 *self, int arg1) {
    unsigned int v = *(unsigned int *)(data_ov002_022cf288 + (self->bit0 & 1) * 0x868);
    if ((v >> 16) & 1) return 0;
    return func_ov002_021ff400(self, arg1);
}
