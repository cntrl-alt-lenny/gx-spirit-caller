/* CAMPAIGN-PREP candidate for func_022a822c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     branch picks tmpl/f10; per-branch f10 store; join order handle,attr,word
 *   risk:       orig hoists the shared `mov r1,#4;mov r2,#0` (02006c0c args) above the branch and stores f10 inside each arm; if mwcc sinks the consts or moves the f10 store to the join, stores reorder. reshape-able (store-order); struct-guessed
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022a822c (ov002, class C, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Predicate selects template + f10 value, then
 * shared OAM commit. f10 stored INSIDE each branch; handle/attr/word at the join.
 *   recipe: branch picks (tmpl,f10); bind handle temp; per-branch f10 store; join stores handle,attr,word in order.
 */
extern void *func_02006c0c(void *tmpl, int n, int m);
extern void  func_02006e1c(void *h);
extern void  func_0201d47c(void *oam);
extern void  func_0201e5b8(void *oam);
extern int   func_ov002_022ae718(void *p);
extern char  data_ov002_022cc32c[];
extern char  data_ov002_022cc348[];
extern char  data_ov002_022d1a9c[];

typedef struct {
    void           *f00;          /* +0x00 handle */
    char            _p04[0x8];
    int             f0c;          /* +0x0c word */
    unsigned short  f10;          /* +0x10 */
    char            _p12[0x2];
    unsigned short  f14;          /* +0x14 attr2 */
} Oam_022a822c;

void func_ov002_022a822c(void)
{
    Oam_022a822c oam;
    void        *h;

    func_0201d47c(&oam);
    if (func_ov002_022ae718(data_ov002_022d1a9c)) {
        h = func_02006c0c(data_ov002_022cc32c, 4, 0);
        oam.f10 = (unsigned short)-1;
    } else {
        h = func_02006c0c(data_ov002_022cc348, 4, 0);
        oam.f10 = 0x60;
    }
    oam.f00 = h;
    oam.f14 = (oam.f14 & ~0xf) | 0x9;
    oam.f0c = 0xb980;
    func_0201e5b8(&oam);
    func_02006e1c(h);
}
