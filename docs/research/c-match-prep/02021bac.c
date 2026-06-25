/* CAMPAIGN-PREP candidate for func_02021bac (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Counted loop, guarded call, two-symbol count alias + reload
 *   risk:       the dual-symbol count (data_02198434 pre-guard vs data_02197434 reload) may not reproduce; mwcc could read both via one symbol
 *   confidence: low
 */
/* func_02021bac: iterate `count` entries (stride 0x68) starting at
 * data_02197434 + 0x1048; call func_02021cbc(e) when the entry's
 * first word is nonzero. count lives at data_02198434 + 0xb0
 * (== data_02197434 + 0x10b0; the same address via two symbols).
 * The pre-loop guard reads it via data_02198434; the in-loop reload
 * comes through the live data_02197434+0x1000 base (r4). */
extern char data_02197434[];
extern char data_02198434[];
extern int  func_02021cbc(int *p);

int func_02021bac(void) {
    int i;
    int *e = (int *)(data_02197434 + 0x1048);
    for (i = 0; i < *(int *)(data_02198434 + 0xb0); i++) {
        if (*e != 0) func_02021cbc(e);
        e += 0x1a;   /* stride 0x68 */
    }
    return 1;
}
