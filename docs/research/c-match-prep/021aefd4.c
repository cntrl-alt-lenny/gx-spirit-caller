/* CAMPAIGN-PREP candidate for func_021aefd4 (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     OAM fill/commit; field stores in orig order; two-f34 RMW kept separate; mode picks cfg
 *   risk:       orig RMWs +0x34 TWICE (|9 then |0x10) around other stores; mwcc may coalesce the two strh or re-order +0x20/+0x2c/+0x38 stores. reshape-able (field-store order) + struct-guessed
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov008_021aefd4 (ov008, class C, MED) — built-free.
 * UNVERIFIED + ITERATION-EXPECTED. OAM marshalling, mul index, struct-field RMW.
 *
 * a0 -> sprite index (*0x34 into a u16 table data_021b2790), a1 -> a 0xc-stride
 * index folded into the OAM "char base". A 0x48 local OAM record is filled by
 * func_0201d47c, fields RMW'd in the orig's STORE ORDER, then committed via
 * func_0201e5b8 and the handle freed via func_02006e1c. The mode flag at
 * data_021040ac+0x34 picks one of two glyph-config args (LIT2 vs LIT3).
 */
extern void func_02091554(void *dst, int glyph, void *cfg);
extern void func_0201d47c(void *p);
extern int  func_02006c0c(void *p, int a, int b);
extern void func_0201e5b8(void *p);
extern void func_02006e1c(int h);

extern char data_021040ac[];          /* _LIT0: int@+0x34 mode flag */
extern char data_ov008_021b2790[];    /* _LIT1: u16 glyph table, stride 0x34 */
extern char data_ov008_021b26ac[];    /* _LIT2: glyph cfg (mode==0) */
extern char data_ov008_021b26c4[];    /* _LIT3: glyph cfg (mode!=0) */

void func_ov008_021aefd4(int a0, int a1) {
    char buf[0x48];
    int handle;
    int glyph = *(unsigned short *)(data_ov008_021b2790 + a0 * 0x34);

    if (*(int *)(data_021040ac + 0x34) == 0) {
        func_02091554(buf + 0x0, glyph, data_ov008_021b26ac);
    } else {
        func_02091554(buf + 0x0, glyph, data_ov008_021b26c4);
    }

    func_0201d47c(buf + 0x20);
    handle = func_02006c0c(buf + 0x0, 4, 0);

    *(unsigned short *)(buf + 0x34) = (*(unsigned short *)(buf + 0x34) & ~0xf) | 0x9;
    *(int *)(buf + 0x20) = handle;
    *(int *)(buf + 0x2c) = ((a1 * 0xc + 0xab + 0x200) << 7);
    *(unsigned short *)(buf + 0x34) = *(unsigned short *)(buf + 0x34) | 0x10;
    *(int *)(buf + 0x38) = (*(int *)(buf + 0x38) & ~0x1c000) | 0x1c000;

    func_0201e5b8(buf + 0x20);
    func_02006e1c(*(int *)(buf + 0x20));
}
