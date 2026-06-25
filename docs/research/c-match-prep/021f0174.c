/* CAMPAIGN-PREP candidate for func_021f0174 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     2D-0x868 table + :13 bitfield + two u16-field guards + tail bool
 *   risk:       (player&1) computed once and shared across 3 table reads in orig; if not CSE'd, extra and insns appear.
 *   confidence: high
 */
/* func_ov002_021f0174: idx guard + subrow f30 + cf1a4-set + cf1a2-clear, then
 * inverted-bool tail.
 *   idx >= 5             -> return 0
 *   subrow.f30 == 0      -> return 0
 *   cf1a4 field == 0     -> return 0
 *   cf1a2 field != 0     -> return 0
 *   return 021c1e44(self,player,idx) == 0
 * No b0/opponent guard here. cf16c :13 id, plus cf1a4 then cf1a2 u16 fields. */

struct self_t { char _pad[2]; unsigned short b0 : 1; unsigned short _r : 15; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a4[];
extern unsigned short data_ov002_022cf1a2[];
extern int func_ov002_021c1e44(struct self_t *self, int player, int idx);

int func_ov002_021f0174(struct self_t *self, int player, int idx) {
    struct subrow *sr;
    if (idx >= 5)
        return 0;
    sr = (struct subrow *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a2 + (player & 1) * 0x868 + idx * 20) != 0)
        return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
