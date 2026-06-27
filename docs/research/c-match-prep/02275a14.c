/* CAMPAIGN-PREP candidate for func_02275a14 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: inline index expr -> mla fusion; slot.id :13; arg0 live r0
 *   risk:       permuter-class: the bl func_021b8fcc has r0 UNSET in the asm (orig never clobbers arg0 in r0, so no reload before the call) — a register-liveness coin-flip mwcc may not reproduce from `func(player,sum)`. Also the mla-vs-mul+add fusion depends on keeping the index inlined (no off/row locals).
 *   confidence: low
 */
/* func_ov002_02275a14: mla-index variant of 02275860 (note: mla, not mul+add).
 * Inlining the whole index expression (no off/row locals) biases mwcc to fuse
 * the two scaled adds into mla. Only slot.id gate here, then sum<5 ->021b8fcc
 * else 021c23ac. arg0 stays live in r0 across to 021b8fcc (orig never reloads). */
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cd300[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021b8fcc(int player, int sum);
extern int func_ov002_021c23ac(int player, int sum);
struct CD300 { unsigned bit0:1; unsigned rest:31; };
int func_ov002_02275a14(int player, int a, int b) {
    int sum = a + b;
    if (player != (int)((struct CD300 *)data_ov002_022cd300)->bit0) return 0;
    if (sum > 10) return 0;
    if (((struct Ov002Slot *)(data_ov002_022cf16c + (player & 1) * 0x868
                              + sum * 0x14 + 0x30))->id == 0) return 0;
    if (sum < 5) {
        if (func_ov002_021b8fcc(player, sum) == 0) return 0;
    }
    if (func_ov002_021c23ac(player, sum) != 0) return 0x800;
    return 0;
}
