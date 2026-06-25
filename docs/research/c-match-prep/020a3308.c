/* CAMPAIGN-PREP candidate for func_020a3308 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     field-zero store-order; tail call (bx ip Style-A form)
 *   risk:       tail `bx ip` needs 1.2/sp2p3; even then mwcc may emit `b func_020a32e4`; const-load scheduling (r3/r2/ip) interleave; offsets guessed
 *   confidence: low
 */
/* func_020a3308 — zero two words + a byte in data_021a9850, zero data_021a984c,
 * then TAIL CALL func_020a32e4.
 * Tail call lowers to `ldr ip,=f; bx ip` (Style A interworking) in the target ->
 * ROUTE AS *.legacy.c (mwcc 1.2/sp2p3). Under 2.0/sp1p5 the tail would be `b func_020a32e4`.
 */

typedef struct {
    int           f_0;      /* +0x0 */
    int           f_4;      /* +0x4 */
    char          _pad08[0x4];
    unsigned char f_c;      /* +0xc */
} data_021a9850_t;

extern data_021a9850_t data_021a9850;
extern int data_021a984c;
extern void func_020a32e4(void);

void func_020a3308(void)
{
    data_021a9850.f_0 = 0;
    data_021a9850.f_4 = 0;
    data_021a9850.f_c = 1;
    data_021a984c = 0;
    func_020a32e4();
}
