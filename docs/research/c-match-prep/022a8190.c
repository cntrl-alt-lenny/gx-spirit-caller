/* CAMPAIGN-PREP candidate for func_022a8190 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-return on refcount; bind handle temp; OAM stores in asm order
 *   risk:       orig makes the -1 arg via `sub r1,#0x37` reusing r0=0x36; mwcc emits mvn r1,#0 instead (1-instr diff). Also OAM store-order f14/f00/f0c/f10 must hold. reshape-able (store-order); -1 peephole permuter-class
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022a8190 (ov002, class C, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Refcount-gate teardown then OAM sprite setup.
 * Store order at OAM: f14(attr), f00(handle), f0c(word), f10(u16=-1).
 *   recipe: early-return on refcount mismatch; bind handle to r4 temp; emit OAM stores in asm order.
 */
extern void *func_02006c0c(void *tmpl, int n, int m);
extern void  func_02006e1c(void *h);
extern void  func_0201d47c(void *oam);
extern void  func_0201e5b8(void *oam);
extern void  func_02037208(int a, int b, int c, int d);
extern char  data_ov002_022cc310[];

typedef struct {
    void           *f00;          /* +0x00 handle */
    char            _p04[0x8];
    int             f0c;          /* +0x0c word */
    unsigned short  f10;          /* +0x10 */
    char            _p12[0x2];
    unsigned short  f14;          /* +0x14 attr2 */
} Oam_022a8190;

void func_ov002_022a8190(char *self, int tag)
{
    Oam_022a8190 oam;
    void        *h;
    int          n;

    n = *(int *)(self + 0x5e4);
    if (tag != n) return;

    *(int *)(self + 0x5e4) = n - 1;
    *(int *)(self + 0x5e8) = -16;

    h = func_02006c0c(data_ov002_022cc310, 4, 0);
    func_0201d47c(&oam);
    oam.f14 = (oam.f14 & ~0xf) | 0x9;
    oam.f00 = h;
    oam.f0c = 0xb980;
    oam.f10 = (unsigned short)-1;
    func_0201e5b8(&oam);
    func_02006e1c(h);

    func_02037208(0x36, -1, 0, 1);
}
