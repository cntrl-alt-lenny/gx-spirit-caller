/* CAMPAIGN-PREP candidate for func_02295de0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D-bitfield :1/:5; bind b0(r4) only across 0202b8f0->02259f74; single ldrh feeds b0+m5 at .L_90
 *   risk:       6 calls + scoped b0 bind (r4) middle while other guards reload inline; mwcc must reload-vs-bind on the exact boundaries and load u16 once for both b0+m5 at .L_90. permuter-class (multi-call reg-alloc).
 *   confidence: low
 */
/* func_ov002_02295de0: long guard chain over u16@+2 = {b0:1, m5:5}.
 *   if 02257ab8(1 - p->b0) == 0             -> return 0
 *   if 021c3ae4(p->b0, 0x18e8) != 0         -> return 0
 *   { b0 = p->b0;  (held in callee r4)
 *     a = 0202b8f0(*(u16*)p);
 *     if *(int*)(base + ((1-b0)&1)*0x868) <= a:
 *         if 02259f74(b0) != 0             -> return 1 }
 *   if 021be4a0(p->b0, p->m5, 1) == 0       -> return 1
 *   return 02280980(p->b0) <= 0
 * The .L_90 block reads u16@+2 once and extracts both b0 (bit0) and m5
 * (bits1..5) from that single load; 0202b8f0's arg is field0 = *(u16*)p. */
extern char data_ov002_022cf16c[];
extern int  func_0202b8f0(int field0);
extern int  func_ov002_021be4a0(int b0, int m5, int one);
extern int  func_ov002_021c3ae4(int b0, int code);
extern int  func_ov002_02257ab8(int v);
extern int  func_ov002_02259f74(int b0);
extern int  func_ov002_02280980(int b0);

struct Ov002Hdr2 {
    char _p2[2];
    unsigned short b0 : 1;
    unsigned short m5 : 5;
};

int func_ov002_02295de0(struct Ov002Hdr2 *p) {
    int a;

    if (func_ov002_02257ab8(1 - p->b0) == 0)
        return 0;
    if (func_ov002_021c3ae4(p->b0, 0x18e8) != 0)
        return 0;
    {
        int b0 = p->b0;
        a = func_0202b8f0(*(unsigned short *)p);
        if (*(int *)(data_ov002_022cf16c + ((1 - b0) & 1) * 0x868) <= a) {
            if (func_ov002_02259f74(b0) != 0)
                return 1;
        }
    }
    if (func_ov002_021be4a0(p->b0, p->m5, 1) == 0)
        return 1;
    return func_ov002_02280980(p->b0) <= 0;
}
