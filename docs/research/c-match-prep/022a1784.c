/* CAMPAIGN-PREP candidate for func_022a1784 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard-chain early-return; decl x before y (slot +4/+0); shared tail
 *   risk:       shared .L_bc join from 5 sites; if mwcc duplicates the 0x300-mask tail or reorders nested ifs, branch graph diverges. reshape-able via goto-to-tail; else permuter-class
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022a1784 (ov002, class C, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Longer guard chain; shared .L_bc join = final
 * 0x300 mask check then return 1. Stack point (x@sp+4, y@sp+0).
 *   recipe: guard-chain early-returns; decl x before y for slot order; OR pen-predicates; (n>0) bool.
 */
extern int  func_ov002_022a1870(void *self);
extern int  func_ov002_022a1890(void *self, int flag);
extern int  func_ov002_022ae588(void *p, int x, int y);
extern void func_0200612c(int *x, int *y);
extern int  func_0200617c(void);
extern int  func_02006194(void);
extern char data_ov002_022d0f2c[];
extern char data_ov002_022d1a9c[];
extern char data_02104bac[];

int func_ov002_022a1784(void *self)
{
    int x, y;

    if (*(int *)self == 0) return 0;

    if (*(int *)(data_ov002_022d0f2c + 0xd4) > 0) return 1;

    if (func_02006194() || func_0200617c()) {
        if (!func_ov002_022a1890(self, 0)) {
            func_0200612c(&x, &y);
            if (func_ov002_022ae588(data_ov002_022d1a9c, x, y) < 0) {
                if (func_ov002_022a1870(self)) return 0;
                if (func_ov002_022a1890(self, 1)) return 0;
            }
        }
    }

    if (*(unsigned short *)(data_02104bac + 0x52) & 0x300) return 0;
    return 1;
}
