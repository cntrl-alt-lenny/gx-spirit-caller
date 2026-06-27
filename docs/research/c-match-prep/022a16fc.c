/* CAMPAIGN-PREP candidate for func_022a16fc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard-chain early-return; (n>0) bool; OR pen-predicates share block
 *   risk:       orig materializes (data_d4>0) via movgt/movle then cmp+bne; mwcc may fold to one cmp+ble. reshape-able: use `int t=(n>0); if(t) return 1;` to force the bool
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022a16fc (ov002, class C, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Guard chain: validate -> input-edge gating.
 *   recipe: guard-chain early-returns; bool-materialize (n>0) then test; OR of two pen predicates -> shared block.
 */
extern int  func_ov002_022a1870(void *self);
extern int  func_ov002_022a1890(void *self, int flag);
extern int  func_0200617c(void);
extern int  func_02006194(void);
extern char data_ov002_022d0f2c[];
extern char data_02104bac[];

int func_ov002_022a16fc(void *self)
{
    if (!func_ov002_022a1870(self)) return 0;

    if (*(int *)(data_ov002_022d0f2c + 0xd4) > 0) return 1;

    if (func_02006194() || func_0200617c()) {
        if (!func_ov002_022a1890(self, 0)) return 0;
    }

    if (*(unsigned short *)(data_02104bac + 0x52) & 0x300) return 0;
    return 1;
}
