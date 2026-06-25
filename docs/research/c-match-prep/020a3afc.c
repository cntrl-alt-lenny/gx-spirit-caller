/* CAMPAIGN-PREP candidate for func_020a3afc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     deref+0x1000 store; tail call (bx ip Style-A form)
 *   risk:       tail `bx ip` needs 1.2/sp2p3; even then may emit `b func_020a3b20`; `add #0x1000` must stay separate; ip-load scheduling
 *   confidence: low
 */
/* func_020a3afc — set int flag at (*data_021a98fc + 0x1000)+0x320 = 1, TAIL CALL func_020a3b20.
 * Tail call lowers to `ldr ip,=f; bx ip` (Style A interworking) in the target ->
 * ROUTE AS *.legacy.c (mwcc 1.2/sp2p3). Under 2.0/sp1p5 the tail would be `b func_020a3b20`.
 */

extern void func_020a3b20(void);

typedef struct {
    char _pad[0x1000];
    char _pad2[0x320];
    int  f_1320;            /* (*ptr + 0x1000) + 0x320 */
} region_t;

extern region_t *data_021a98fc;

void func_020a3afc(void)
{
    data_021a98fc->f_1320 = 1;
    func_020a3b20();
}
