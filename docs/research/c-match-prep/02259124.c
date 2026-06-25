/* CAMPAIGN-PREP candidate for func_02259124 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch(c) 11..15; param-shuffle a->r3/ip kept live; unsigned>= guard; OR-accum; single 591e4 call
 *   risk:       param a is held in ip across the whole dispatch (passed as last arg to f74/c0c8); if mwcc spills/reloads a instead of keeping it in a callee reg the prologue+call setup diverge. Also case-body order vs addls table. reshape-able.
 *   confidence: med
 */
/* func_ov002_02259124 (ov002, class C) — jump-table sibling, dispatch on c (11..15).
 * arg map a=p0,b=p1,c=p2,d=p3. 11/default: f74(d6c,b,c+d,a)?|=8.
 * 12: tbl=cf178[(b&1)*0x868]; if d>=tbl ret 0; else if d6c==b && c0c8(b,d,a)?|=8.
 * 13/14/15: |=022591e4(b,c).
 */
extern char data_ov002_022cf178[];
extern char data_ov002_022d016c[];
extern int func_ov002_021fbf74(int a, int b, int c, int d);
extern int func_ov002_021fc0c8(int a, int b, int c);
extern int func_ov002_022591e4(int a, int b);

int func_ov002_02259124(int a, int b, int c, int d) {
    int r = 0;
    switch (c) {
    case 12:
        if ((unsigned int)d >= *(unsigned int *)(data_ov002_022cf178 + (b & 1) * 0x868))
            return r;
        if (*(int *)(data_ov002_022d016c + 0xD6C) == b) {
            if (func_ov002_021fc0c8(b, d, a) != 0)
                r |= 8;
        }
        break;
    case 13:
    case 14:
    case 15:
        r |= func_ov002_022591e4(b, c);
        break;
    default:
        if (func_ov002_021fbf74(*(int *)(data_ov002_022d016c + 0xD6C), b, c + d, a) != 0)
            r |= 8;
        break;
    }
    return r;
}
