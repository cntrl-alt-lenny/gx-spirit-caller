/* CAMPAIGN-PREP candidate for func_02259058 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch(b) 11..15 via addls pc table; unsigned >= guard; OR-accumulate r; default shares case-11
 *   risk:       jump-table body order: orig lays default/case11 (.L_bf0) last and case12 (.L_b8c) first via the addls table; mwcc may emit bodies in source order, flipping branch targets. reshape-able (reorder case bodies to match table).
 *   confidence: med
 */
/* func_ov002_02259058 (ov002, class C) — jump-table dispatch on b (11..15), OR-accum flags.
 * 11/default: f74(d6c, a, b+c, 0)?|=8. 12: tbl=cf178[(a&1)*0x868]; if c>=tbl ret 0;
 *   else if d6c==a && c0c8(a,c,0)?|=8. 13/14/15: |=022591e4(a,b); |=02259278(a,b).
 */
extern char data_ov002_022cf178[];
extern char data_ov002_022d016c[];
extern int func_ov002_021fbf74(int a, int b, int c, int d);
extern int func_ov002_021fc0c8(int a, int b, int c);
extern int func_ov002_022591e4(int a, int b);
extern int func_ov002_02259278(int a, int b);

int func_ov002_02259058(int a, int b, int c) {
    int r = 0;
    switch (b) {
    case 12:
        if ((unsigned int)c >= *(unsigned int *)(data_ov002_022cf178 + (a & 1) * 0x868))
            return r;
        if (*(int *)(data_ov002_022d016c + 0xD6C) == a) {
            if (func_ov002_021fc0c8(a, c, 0) != 0)
                r |= 8;
        }
        break;
    case 13:
    case 14:
    case 15:
        r |= func_ov002_022591e4(a, b);
        r |= func_ov002_02259278(a, b);
        break;
    default:
        if (func_ov002_021fbf74(*(int *)(data_ov002_022d016c + 0xD6C), a, b + c, 0) != 0)
            r |= 8;
        break;
    }
    return r;
}
