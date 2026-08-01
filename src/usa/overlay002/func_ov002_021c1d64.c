/* func_ov002_021c1d64: dispatch on a0's card kind (f0). Kind 0x17 always
 * forwards to func_ov002_021c1d40. Kind 0x16, or any kind whose (f2>>1)&0x1f
 * field falls in [5,0xa) AND func_0202e1e0(f0) is nonzero, forwards to
 * func_ov002_021c1c48. Both forwards pass the "orientation differs" flag
 * (a1 != (f2 & 1)). Anything else returns 0. */
typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;   /* bit 0 of f2 */
    unsigned short field : 5;   /* bits 1-5 of f2 */
    unsigned short       : 10;  /* bits 6-15 of f2, unused here */
} Card021c1e44;

extern int func_0202b824(unsigned short id);
extern int func_0202e1e0(unsigned short id);
extern int func_ov002_021c1d40(int a1, int a2, int flag);
extern int func_ov002_021c1c48(int a1, int a2, int flag);

int func_ov002_021c1d64(Card021c1e44 *a0, int a1, int a2)
{
    if (func_0202b824(a0->f0) == 0x17) {
        return func_ov002_021c1d40(a1, a2, a1 != a0->flag0);
    }

    if (func_0202b824(a0->f0) != 0x16) {
        if (a0->field < 5) {
            goto return_zero;
        }
        if (a0->field >= 0xa) {
            goto return_zero;
        }
        if (func_0202e1e0(a0->f0) == 0) {
            goto return_zero;
        }
    }

    return func_ov002_021c1c48(a1, a2, a1 != a0->flag0);

return_zero:
    return 0;
}
