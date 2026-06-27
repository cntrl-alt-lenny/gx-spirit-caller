/* CAMPAIGN-PREP candidate for func_021b1e20 (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     re-read base each access (no cache); bind func_02021660 result to temp; if/else two-arm tail
 *   risk:       Two tail arms differ only by literal (lit2/lit3); mwcc may hoist the common (base+0x70, f10) loads or pick wrong dest reg for the str-vs-bl scheduling. reshape-able (if/else keeps arms separate; flip to one-deref-per-arm if it caches).
 *   confidence: med
 */
/* func_ov008_021b1e20 (ov008, class C): guarded setter, two-arm tail, bound call result.
 * Base *data_ov008_021b270c is RE-READ each access (ov008 'do not cache' rule:
 * the asm reloads ldr rX,[r2] / ldr r0,[r0] at every step). func_02021660's
 * result is bound to r4 and reused for both func_020216b0 calls. */

extern char data_021040ac[];
extern char data_ov008_021b270c[];
extern char data_ov008_021b2718[];
extern char data_ov008_021b272c[];

extern int  func_02021660(int a, int b, int c);
extern void func_020216b0(int a, int b, int c);
extern void func_02091554(void *str, void *arg, int pal);
extern void func_ov008_021b1998(void);
extern void func_ov008_021b1ad8(int a);
extern void func_ov008_021b1c14(void);

void func_ov008_021b1e20(int a0, int a1) {
    int *o = *(int **)data_ov008_021b270c;
    int t;

    if (*(int *)((char *)o + 0x10) == a0 && a1 == 0) {
        return;
    }
    *(int *)((char *)o + 0x10) = a0;

    func_ov008_021b1998();
    func_ov008_021b1ad8(0);
    func_ov008_021b1c14();

    t = func_02021660(*(int *)((char *)*(int **)data_ov008_021b270c + 0x4), 3, 2);
    func_020216b0(t, 2, 0x29);
    func_020216b0(t, 0, 0x41);

    if (*(int *)(data_021040ac + 0x34) == 0) {
        func_02091554((char *)*(int **)data_ov008_021b270c + 0x70,
                      data_ov008_021b2718,
                      *(int *)((char *)*(int **)data_ov008_021b270c + 0x10));
    } else {
        func_02091554((char *)*(int **)data_ov008_021b270c + 0x70,
                      data_ov008_021b272c,
                      *(int *)((char *)*(int **)data_ov008_021b270c + 0x10));
    }
}
