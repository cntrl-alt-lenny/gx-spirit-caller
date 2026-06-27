/* CAMPAIGN-PREP candidate for func_02237704 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     phase switch; packed ret split lo=r&0xff / hi=(short)r>>8; smulbb idx; 5th arg via stack; parity off
 *   risk:       permuter-class: getting smulbb for idx=(hi&0xff)*0x14 needs mwcc to keep BOTH operands 16-bit — fragile vs a plain mul/mla. Secondary reshape-able: lo must stay live (computed pre-smulbb) as 021d6808 arg2.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02237704 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. Phase switch on *(int*)(ce288+0x5a8); sub sp,#4
 * is the 5th (stacked) arg to 021d6808.
 *   0x7f -> return func_0220e77c();    (r0 passthrough)
 *   0x80 -> if(!(h4 bit2) && 0223df38(0,0)){
 *             r = 0223de94(obj,0);
 *             lo = r & 0xff;  hi = (short)r >> 8;          (asr -> SIGNED short >>8)
 *             off = (lo&1)*0x868;  idx = (hi&0xff)*0x14;   (idx via SMULBB!)
 *             if(*(u16*)(cf1a4+off+idx) && !*(u16*)(cf1a2+off+idx))
 *                021d6808(obj, lo, hi&0xff, 0, [stack]1);
 *           } return 0x7f
 *   else -> return 0
 * lo (r&0xff) is computed BEFORE the smulbb and survives as 021d6808's 2nd arg. */
extern char data_ov002_022ce288[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
extern void func_ov002_021d6808(void *o, int lo, int hi, int z, int one);
extern int  func_ov002_0220e77c(void);
extern int  func_ov002_0223de94(void *o, int a);
extern int  func_ov002_0223df38(int a, int b);

struct Obj704 { unsigned short h0; unsigned short pad2; unsigned short h4b2pre : 2; unsigned short h4b2 : 1; };

int func_ov002_02237704(struct Obj704 *o) {
    int phase = *(int *)(data_ov002_022ce288 + 0x5a8);
    int r, lo, off, idx;
    short hi;

    if (phase == 0x7f)
        return func_ov002_0220e77c();
    if (phase != 0x80)
        return 0;

    if (o->h4b2 == 0 && func_ov002_0223df38(0, 0) != 0) {
        r = func_ov002_0223de94(o, 0);
        lo = r & 0xff;
        hi = (short)r >> 8;
        off = (lo & 1) * 0x868;
        idx = (short)(hi & 0xff) * (short)0x14;
        if (*(unsigned short *)((char *)data_ov002_022cf1a4 + off + idx) != 0 &&
            *(unsigned short *)((char *)data_ov002_022cf1a2 + off + idx) == 0)
            func_ov002_021d6808(o, lo, hi & 0xff, 0, 1);
    }
    return 0x7f;
}
