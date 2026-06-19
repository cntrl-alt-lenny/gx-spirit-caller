/* func_ov002_022347a4: C-39f bit-0-indexed table lookup (gotcha 14).
 * 3-arg/2-arg helper keeps self+arg1 live -> index to ip/r2/r3;
 * explicit (bit0 & 1) reproduces the redundant `and #1`.
 */
typedef unsigned short u16;
struct S02234894 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf1a8[];
extern void func_ov002_02214630(struct S02234894 *self, int arg1);
int func_ov002_022347a4(struct S02234894 *self, int arg1) {
    unsigned int v = *(unsigned int *)(data_ov002_022cf1a8 + (self->bit0 & 1) * 0x868);
    if ((v >> 16) & 1) return 0;
    func_ov002_02214630(self, arg1);
    return 0;
}
