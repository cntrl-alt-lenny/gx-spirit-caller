/* CAMPAIGN-PREP candidate for func_020a2394 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     set kind once + pass &kind; index loop strength-reduces to running ptrs; trailing block copy
 *   risk:       reshape-able: mwcc must strength-reduce &data_020c3630[i]/&out->slot[i] to add #4/#0x10 running ptrs; if it recomputes base+i*S, the loop body's adds diverge. struct-guessed offsets.
 *   confidence: med
 */
/* func_020a2394 (main, class C) — copy two fields, run a 3-iteration helper
 * loop with a stack-arg + striding pointers, then a block copy.
 *   r0 = out, r1 = in
 *
 * asm shape:
 *   int kind = 0x022c0000;                 // stack arg, set once, &kind passed
 *   out->f0 = in->f24;
 *   out->f4 = in->f34;
 *   for (i = 0; i < 3; i++)
 *       func_020a21dc(in, &data_020c3630[i], &out->slot[i], &kind);  // slot stride 0x10
 *   func_02094688(&in->f160, &out->f3c, 0x88);
 */

typedef struct { char _pad[0x10]; } a2394_slot;     /* stride 0x10 */

extern int  data_020c3630[];                         /* indexed [i], stride 4 */
extern void func_020a21dc(void *in, int *entry, void *dst, int *kind);
extern void func_02094688(void *src, void *dst, int len);

typedef struct {
    char           _pad00[0x24];
    int            f24;       /* +0x24 */
    char           _pad28[0x34 - 0x28];
    int            f34;       /* +0x34 */
    char           _pad38[0x160 - 0x38];
    char           f160[0x88];/* +0x160 block copied out */
} a2394_in;

typedef struct {
    int            f0;        /* +0x00 = in->f24 */
    int            f4;        /* +0x04 = in->f34 */
    char           _pad08[0x0c - 0x08];
    a2394_slot     slot[3];   /* +0x0c, stride 0x10 -> ends 0x3c */
    char           f3c[0x88]; /* +0x3c block-copy dst */
} a2394_out;

void func_020a2394(a2394_out *out, a2394_in *in)
{
    int kind = 0x022c0000;
    int i;

    out->f0 = in->f24;
    out->f4 = in->f34;

    for (i = 0; i < 3; i++)
        func_020a21dc(in, &data_020c3630[i], &out->slot[i], &kind);

    func_02094688(&in->f160, out->f3c, 0x88);
}
