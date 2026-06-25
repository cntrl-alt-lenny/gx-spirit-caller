/* CAMPAIGN-PREP candidate for func_021f058c (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     leaf 2D-table predicate + :13/:1 bitfields, bx lr
 *   risk:       (player&1) shared across 3 reads; orig keeps idx*20 in ip and parity in r3 — reg-alloc may diverge.
 *   confidence: high
 */
/* func_ov002_021f058c: pure leaf predicate (no calls).
 *   player != self->b0   -> return 0
 *   idx >= 5             -> return 0
 *   subrow.f30 == 0      -> return 0
 *   if (cf1a4 field == 0) return 1;
 *   return cf1a2 field == 0
 * cf16c :13 id, then cf1a4 then cf1a2 u16 fields; bx lr epilogue (leaf). */

struct self_t { char _pad[2]; unsigned short b0 : 1; unsigned short _r : 15; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a4[];
extern unsigned short data_ov002_022cf1a2[];

int func_ov002_021f058c(struct self_t *self, int player, int idx) {
    struct subrow *sr;
    if (player != self->b0)
        return 0;
    if (idx >= 5)
        return 0;
    sr = (struct subrow *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) == 0)
        return 1;
    return *(unsigned short *)((char *)data_ov002_022cf1a2 + (player & 1) * 0x868 + idx * 20) == 0;
}
