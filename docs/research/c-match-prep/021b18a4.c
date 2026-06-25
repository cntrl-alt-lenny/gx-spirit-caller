/* CAMPAIGN-PREP candidate for func_021b18a4 (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload *270c per access (no caching); discriminant=stored f6c; MMIO 0x4000000 double-read RMW
 *   risk:       bind-vs-reload of *data_021b270c: orig RELOADS the base on most accesses (ldr r1,[r1] chains) — if mwcc caches it to one callee reg, many ldr diverge; conversely my repeated casts may add/drop one. reshape-able (bind/reload, per-access)
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov008_021b18a4 (ov008, class C, MED) — built-free.
 * UNVERIFIED + ITERATION-EXPECTED. State setter, nested struct loads, MMIO RMW.
 *
 * o = *data_021b270c (the scene obj). Early-out if o->f6c == a0. Store a0 to f6c.
 * Then if (a0 != 0): if (o->f4 == 0) open a printer into o->f4 + post-setup;
 * notify(0x29, o+0x70); set BG mode bits @REG 0x4000000 to ...|7. Else (a0==0):
 * if (o->f4) close it & null f4; clear those BG mode bits (& ~6).
 */
extern int  func_020211c8(void *cfg);
extern void func_0202147c(int h);
extern void func_ov008_021b1e20(int a0, int a1);
extern void func_0202227c(int a0, void *p);
extern void func_020212cc(int h);

extern char data_ov008_021b270c[];    /* _LIT0: *-> scene obj */
extern char data_020f8700[];          /* _LIT1: printer cfg */

void func_ov008_021b18a4(int a0) {
    int *o = *(int **)data_ov008_021b270c;
    volatile unsigned *reg;
    unsigned t;

    if (o[0x6c / 4] == a0) return;          /* o->f6c */
    o[0x6c / 4] = a0;

    o = *(int **)data_ov008_021b270c;
    if (o[0x6c / 4] != 0) {
        if (o[0x4 / 4] == 0) {
            int h = func_020211c8(data_020f8700);
            (*(int **)data_ov008_021b270c)[0x4 / 4] = h;
            func_0202147c((*(int **)data_ov008_021b270c)[0x4 / 4]);
            func_ov008_021b1e20((*(int **)data_ov008_021b270c)[0x10 / 4], 1);
        }
        func_0202227c(0x29, (char *)(*(int **)data_ov008_021b270c) + 0x70);
        reg = (volatile unsigned *)0x4000000;
        t = (*reg & 0x1f00) >> 8;
        *reg = (*reg & ~0x1f00) | ((t | 0x7) << 8);
    } else {
        if (o[0x4 / 4] != 0) {
            func_020212cc(o[0x4 / 4]);
            (*(int **)data_ov008_021b270c)[0x4 / 4] = 0;
        }
        reg = (volatile unsigned *)0x4000000;
        t = (*reg & 0x1f00) >> 8;
        *reg = (*reg & ~0x1f00) | ((t & ~0x6) << 8);
    }
}
