/* CAMPAIGN-PREP candidate for func_0208906c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clamp as if-assign (movhi, unsigned >); bind m in r4 across calls; recompute m+0x34 each call
 *   risk:       orig holds m in r4 across both calls and recomputes add r0,r4,#0x34 twice (not bound). If mwcc CSEs &m->f34 into a callee reg, an extra mov/ldr diverges. struct-guessed (Table layout) + reshape-able.
 *   confidence: med
 */
// func_0208906c — table lookup + bounds check + unsigned clamp, base bound across calls
// data_021a5800: global pointer to module context.
struct Entry  { int f0; int f4; int pad8; int padc; };          // 0x10 stride
struct Table  { int pad0; int pad4; int count; struct Entry e[1]; }; // count at +0x8, e[] at +0xc
struct Ctx    { char pad[0x34]; int sub34; };
struct Mod    { char pad[0x84]; struct Table *tbl; };
extern struct Mod *data_021a5800;
extern int func_02097ea4(void *a, int b, int c);
extern int func_02097f10(void *a, int b, int c);

int func_0208906c(unsigned int idx, int p1, int p2, int p3)
{
    struct Mod *m = data_021a5800;
    struct Table *t = m->tbl;
    if (idx >= (unsigned int)t->count) {
        return -1;
    }
    {
        int avail = t->e[idx].f4 - p3;
        if ((unsigned int)p2 > (unsigned int)avail) {
            p2 = avail;
        }
        if (func_02097ea4((char *)m + 0x34, t->e[idx].f0 + p3, 0) == 0) {
            return -1;
        }
    }
    return func_02097f10((char *)m + 0x34, p1, p2);
}
