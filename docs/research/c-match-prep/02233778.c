/* CAMPAIGN-PREP candidate for func_02233778 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sel dispatch; attr&1 word-index; if-store of call result; (attr>>1)&0x1f slot; max-clamp via movle
 *   risk:       asm TRUNCATED: the sel==0x7e branch is largely cut off (021d6808 vs 021c8470/84a8 sub-branch, args, stores all missing) so that arm is a stub. permuter-class + incomplete (rebuild the 0x7e block from full asm).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02233778 (ov002, class D) - brief 494.
 * UNVERIFIED build-free, TAIL TRUNCATED (the sel==0x7e / .L_244-.L_270 block
 * is cut off mid-stream). sel = *(int*)(ce288 + 0x5a8).
 *   sel==0x80: if(!0220b258()) return 0; v = *(int*)(d016c + (attr&1)*4);
 *       if v==1 { *(int*)(d0e6c+0xd44) = 021b00d0(2); } else 021ae664(0x38); return 0x7f
 *   sel==0x7f: 0226b22c(attr&1, (attr>>1)&0x1f, 1, *(int*)(d0e6c+0xd44)); return 0x7e
 *   sel==0x7e: [TRUNCATED] clamp max(021c8470(..)-021c84a8(..),0) path; placeholder return 0
 *   else: return 0
 * LIT1=d016c(state arr), LIT2=d0e6c(globals), LIT3/LIT4 = other tables (cut off). */
typedef unsigned short u16;

extern char data_ov002_022cd3f4[];   /* LIT4 (cut off in pool)                 */
extern char data_ov002_022cd744[];
extern char data_ov002_022ce288[];   /* LIT0: sel @ +0x5a8                     */
extern char data_ov002_022d016c[];   /* LIT1: word array indexed by attr&1     */
extern char data_ov002_022d0e6c[];   /* LIT2/LIT3: globals (+0xd44, +0xb2)     */
extern int  func_ov002_021ae664(int);
extern int  func_ov002_021b00d0(int);
extern int  func_ov002_021c8470(int, int);
extern int  func_ov002_021c84a8(int, int);
extern int  func_ov002_021d6808(void *, int, int, int);
extern int  func_ov002_0226b22c(int, int, int, int);
extern int  func_ov002_0220b258(void);

int func_ov002_02233778(void *cardv) {
    u16 *base = (u16 *)cardv;
    int sel = *(int *)(data_ov002_022ce288 + 0x5a8);

    if (sel == 0x80) {
        u16 attr;
        int v;
        if (func_ov002_0220b258() == 0)
            return 0;
        attr = base[1];
        v = *(int *)(data_ov002_022d016c + (attr & 1) * 4);
        if (v == 1)
            *(int *)(data_ov002_022d0e6c + 0xd44) = func_ov002_021b00d0(2);
        else
            func_ov002_021ae664(0x38);
        return 0x7f;
    }
    if (sel == 0x7f) {
        u16 attr = base[1];
        func_ov002_0226b22c(attr & 1, (attr >> 1) & 0x1f, 1,
            *(int *)(data_ov002_022d0e6c + 0xd44));
        return 0x7e;
    }
    if (sel == 0x7e) {
        /* TRUNCATED in source asm: clamp max(021c8470(a,b)-021c84a8(c,d),0) */
        int hi = func_ov002_021c8470(0, 0);
        int lo = func_ov002_021c84a8(0, 0);
        int d = hi - lo;
        if (d <= 0)
            d = 0;
        (void)d;
        return 0;
    }
    return 0;
}
