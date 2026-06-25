/* CAMPAIGN-PREP candidate for func_021f198c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     leaf 2D-table accessor + :13 bitfield, bx lr
 *   risk:       (player&1) shared across both reads; if recomputed the second and appears — otherwise byte-exact.
 *   confidence: high
 */
/* func_ov002_021f198c: leaf accessor — subrow f30 guard then cf1a4-clear test.
 *   subrow.f30 == 0      -> return 0
 *   return cf1a4 field == 0
 * No self/idx-bound guards (player,idx are the only inputs used for indexing).
 * cf16c :13 id at [+0x30]; cf1a4 u16 field; both 0x868-strided; bx lr leaf. */

struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a4[];

int func_ov002_021f198c(int self, int player, int idx) {
    struct subrow *sr = (struct subrow *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    return *(unsigned short *)((char *)data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) == 0;
}
