/* CAMPAIGN-PREP candidate for func_0225ac68 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch d30 fall-through state0->state1; (cond?0x8000:0)|c then &0xffff; sign-pack
 *   risk:       permuter-class: state-0 no-setup path FALLS THROUGH into state-1 (shared .L_3c0); a C switch/if must replicate the fallthrough without an extra branch -- mwcc may emit a jump table or reorder. Also r5=movs/bmi is signed test; LIT consts are placeholders (struct-guessed).
 *   confidence: low
 */
/* func_ov002_0225ac68: class D state machine on pool field 0xd30.
 * state 0: if 0225a098() -> setup branch (call 021d5b80, 021ae400,
 *          set d2c=0xd, d30=0, d34=1, return); else build two packed
 *          args and call 021d479c twice, then d30++ and FALL INTO
 *          state 1.
 * state 1 (.L_3c0): call 021b41a4 -> r5; if r5<0 -> return 1; else
 *          call 021d5c50(arg,0xb,r5), pack (arg&1)<<31 | 0xLIT4, call
 *          021e30b4, return 0.
 * default: return 1.
 * The 021d479c packing: cond ? 0x8000 : 0, | const, then (x<<16)>>16.
 */
struct Pool0225ac68 {
    char pad_d2c[0xd2c];
    int  f_d2c;        /* 0xd2c */
    int  f_d30;        /* 0xd30 */
    int  f_d34;        /* 0xd34 */
};
extern struct Pool0225ac68 data_ov002_022d016c;
extern int  data_ov002_021ae400;   /* address used as r1 literal (_LIT2) */
extern int  func_ov002_021ae400(int r0, int r1);
extern int  func_ov002_021b41a4(int r0, int r1, int r2);
extern void func_ov002_021d479c(unsigned int r0, int r1, int r2, int r3);
extern void func_ov002_021d5b80(int r0, int r1, int r2, int r3);
extern void func_ov002_021d5c50(int r0, int r1, int r2, int r3);
extern void func_ov002_021e30b4(unsigned int r0, int r1, int r2);
extern int  func_ov002_0225a098(void);

extern int data_LIT1_0225ac68;   /* _LIT1 r2 const for 021d5b80 */
extern int data_LIT2_0225ac68;   /* _LIT2 r1 const for 021ae400 */
extern int data_LIT3_0225ac68;   /* _LIT3 r2 const for 021b41a4/021d5c50 */
extern int data_LIT4_0225ac68;   /* _LIT4 base const for 021e30b4 */

int func_ov002_0225ac68(int arg)
{
    int sel = data_ov002_022d016c.f_d30;
    if (sel == 0) {
        if (func_ov002_0225a098() != 0) {
            func_ov002_021d5b80(arg, 0xb, data_LIT1_0225ac68, 1);
            func_ov002_021ae400(arg, data_LIT2_0225ac68);
            data_ov002_022d016c.f_d2c = 0xd;
            data_ov002_022d016c.f_d30 = 0;
            data_ov002_022d016c.f_d34 = 1;
            return 0; /* falls through to pop in asm; r0 here is don't-care 0 */
        }
        {
            unsigned int p0 = (((arg != 0) ? 0x8000u : 0u) | 0x18u);
            func_ov002_021d479c(p0 & 0xffffu, 1, 0, 0);
        }
        {
            unsigned int p1 = (((arg != 0) ? 0x8000u : 0u) | 0xfu);
            func_ov002_021d479c(p1 & 0xffffu, 0, 0, 0);
        }
        data_ov002_022d016c.f_d30 = data_ov002_022d016c.f_d30 + 1;
    } else if (sel != 1) {
        return 1;
    }
    {
        int r5 = func_ov002_021b41a4(arg, 0xb, data_LIT3_0225ac68);
        if (r5 < 0)
            return 1;
        func_ov002_021d5c50(arg, 0xb, data_LIT3_0225ac68, r5);
        {
            unsigned int p = (((unsigned int)arg << 31) & 0x80000000u) | (unsigned int)data_LIT4_0225ac68;
            func_ov002_021e30b4(p, 0, r5);
        }
        return 0;
    }
}
