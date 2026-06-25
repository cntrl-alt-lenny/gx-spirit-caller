/* CAMPAIGN-PREP candidate for func_02292998 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: side=f0 bound once for table+rsb; reload f0 per later call; if-assign returns
 *   risk:       orig holds ip=f0 across mul-index, tst, AND rsb(1-f0)=r1 arg in ONE block; if mwcc recomputes 1-side separately the rsb/and pairing diverges. permuter-class
 *   confidence: low
 */
typedef struct Unit {
    unsigned short field0;
    unsigned short f0 : 1;
    unsigned short f1 : 5;
    unsigned short pad6 : 6;
    unsigned short f12 : 2;
    unsigned short f14 : 1;
    unsigned short pad15 : 1;
} Unit;

extern unsigned char data_ov002_022cf288[];
extern int func_ov002_021bbf50(int side);
extern int func_ov002_02257ab8(int notside);
extern int func_ov002_02280980(int side);
extern int func_ov002_0228c460(int side);

int func_ov002_02292998(Unit *u) {
    int side = u->f0;
    if (*(int *)(data_ov002_022cf288 + side * 0x868) >> 0x11 & 1)
        return 0;
    if (func_ov002_02257ab8(1 - side) == 0)
        return 0;
    if (func_ov002_0228c460(u->f0) != 0)
        return 1;
    if (func_ov002_021bbf50(u->f0) == 0) {
        if (func_ov002_021bbf50(1 - u->f0) >= 2)
            return 1;
    }
    return func_ov002_02280980(u->f0) < -1 ? 1 : 0;
}
