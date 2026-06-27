/* CAMPAIGN-PREP candidate for func_021c215c (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch->branch-table, default-first, selector single-expr not re-derived
 *   risk:       reshape-able-ish but second arg: orig emits `sub r1,r0,#0x3b` (K-(K+1)) for -1 not mvn; if mwcc folds -1 to mvn this diverges; permuter-class codegen detail.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov006_021c215c (ov006, class D) — brief 494.
 * UNVERIFIED build-free draft. branch-table dispatcher returning constants.
 * selector = f5c + (f60<<2) + 1; `cmp #7; addls pc,pc,r0,lsl#2` 8-way table.
 * cases 0(def),1..7 -> write fields + call func_02037208(K,-1,0,1).
 * recipe: switch-returning-constants -> branch-table, explicit default first,
 * selector NOT re-derived (single expr).
 */
extern void func_02037208(int a, int b, int c, int d);

struct St215c {
    char _0[0x50];
    int  f50;            /* +0x50 */
    char _54[4];
    int  f58;            /* +0x58 */
    int  f5c;            /* +0x5c selector lo */
    int  f60;            /* +0x60 selector hi */
    char _64[8];
    int  f6c;            /* +0x6c */
    char _70[12];
    int  f7c;            /* +0x7c */
    int  f80;            /* +0x80 */
    int  f84;            /* +0x84 */
};

int func_ov006_021c215c(struct St215c *self) {
    int sel = self->f5c + (self->f60 << 2) + 1;
    switch (sel) {
    default:
        return 0;
    case 1:
        self->f58 = 0;
        goto common;
    case 2:
        self->f58 = 1;
        goto common;
    case 3:
        self->f58 = 3;
        goto common;
    case 4:
        self->f58 = 2;
    common:
        func_02037208(0x3a, -1, 0, 1);
        self->f6c = 1;
        return 1;
    case 5:
        func_02037208(0x46, -1, 0, 1);
        self->f7c = 7;
        self->f80 = 0xe;
        self->f84 = 0;
        return 0;
    case 6:
        func_02037208(0x46, -1, 0, 1);
        self->f7c = 7;
        self->f80 = 0xf;
        self->f84 = 0;
        return 0;
    case 7:
        func_02037208(0x3a, -1, 0, 1);
        self->f6c = 0;
        self->f50 = 1;
        return 0;
    }
}
