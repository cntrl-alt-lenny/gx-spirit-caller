/* CAMPAIGN-PREP candidate for func_02255ac8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (u8) byte-pack lever; shared 2D base (arg1*0x14 held, (arg0&1)*0x868 held); asymmetric shift extracts as raw C; flag computed before the trailing call.
 *   risk:       the per-player 2D address math (mla fusion + CSE of arg1*0x14 and (arg0&1)*0x868 across two loads) and call-boundary scheduling will shift the whole allocation; permuter/reg-alloc-class. Ships .s.
 *   confidence: low
 */
/* func_ov002_02255ac8: multi-stage orchestrator. Resolve a packed 16-bit id
 * (021b3618); bail on 0xffff or a failed 021b9d34 guard. Split id into low/hi
 * bytes, push two updates (021d9144, 021d5ab4 with an (arg0,arg1) byte-pack).
 * If arg2==0 and the per-player gate bit6 is clear, read the +0x30 sub-row
 * record, derive a packed field and post 021df62c, then 021de480. */

typedef unsigned char u8;

extern int  func_ov002_021b3618(int a, int b, int c);
extern int  func_ov002_021b9d34(int a, int b);
extern int  func_ov002_021b9bd4(int a, int b);
extern int  func_ov002_021b9ecc(int a, int b);
extern void func_ov002_021d9144(int a, int b, int c);
extern void func_ov002_021d5ab4(int a, int b, int c, int d);
extern void func_ov002_021df62c(int a, int b, int c);
extern void func_ov002_021de480(int a, int b, int c, int d);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1ac[];

void func_ov002_02255ac8(int arg0, int arg1, int arg2) {
    int id;
    int lo;
    int hi;
    int gate;
    int rec;
    int flag;
    id = func_ov002_021b3618(arg0, arg1, arg2);
    if (id == 0xffff) return;
    if (func_ov002_021b9d34(arg0, arg1) == 0) return;
    lo = id & 0xff;
    hi = ((id & 0xffff) >> 8) & 0xff;
    func_ov002_021d9144(arg0, arg1, 1);
    if (func_ov002_021b9bd4(arg0, arg1) + 1 < 3) return;
    func_ov002_021d5ab4(lo, hi,
        (unsigned)(((u8)arg0 | ((u8)arg1 << 8)) << 16) >> 16, 1);
    if (arg2 != 0) return;
    gate = *(int *)(data_ov002_022cf1ac + arg1 * 0x14 + (arg0 & 1) * 0x868);
    if ((gate >> 6) & 1) return;
    rec = *(int *)(data_ov002_022cf16c + arg1 * 0x14 + (arg0 & 1) * 0x868 + 0x30);
    func_ov002_021df62c(arg0, arg1,
        (((unsigned)(rec << 2) >> 24) << 1) + ((unsigned)(rec << 18) >> 31));
    flag = (lo != arg0) ? 1 : 0;
    func_ov002_021de480(lo, hi, flag, func_ov002_021b9ecc(arg0, arg1));
}
