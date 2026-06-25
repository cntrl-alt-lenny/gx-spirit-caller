/* CAMPAIGN-PREP candidate for func_0205c6e4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-zeroed call w/ out-param, early-return, conditional error store
 *   risk:       7-arg call: three stacked zeros (str 0 x3) + &out at sp+0xc; frame 0x14; moveq r0,#0x65/streq/moveq sequence ordering
 *   confidence: low
 */
/* func_0205c6e4: call func_0205be60(arg0, 2, 0, &out, 0,0,0). If it
 * returns nonzero, propagate. Else call func_0205a0ec(arg0, arg1->+c,
 * out->+0x18); if THAT is 0, set arg1->+0 = 0x65 and return 0,
 * otherwise return its result.
 */

extern int func_0205be60(void *a0, int a1, int a2, void *out,
                         int s0, int s1, int s2);
extern int func_0205a0ec(void *a0, int a1, int a2);

typedef struct {
    char _pad_00[0x18];
    int  f18;     /* +0x18 */
} OutRec;

typedef struct {
    int  status;  /* +0x00 */
    char _pad_04[0xc - 0x4];
    int  fc;      /* +0x0c */
} Arg1;

int func_0205c6e4(void *a0, Arg1 *a1) {
    OutRec *out;
    int r;

    r = func_0205be60(a0, 2, 0, &out, 0, 0, 0);
    if (r != 0) {
        return r;
    }
    r = func_0205a0ec(a0, a1->fc, out->f18);
    if (r == 0) {
        a1->status = 0x65;
        return 0;
    }
    return r;
}
