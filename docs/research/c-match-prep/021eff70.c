/* CAMPAIGN-PREP candidate for func_021eff70 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     2D table + bitfields + :8 high-byte flag + compare-tail
 *   risk:       f6hi :8 high-byte may emit ldrb[+7] instead of ldrh;lsl;lsr; f8 offset assumes packing right after f6.
 *   confidence: med
 */
/* func_ov002_021eff70: idx/opponent guards + subrow f30 + cf1a4 field, then a
 * high-byte flag at [+6] selects between a compare-call and constant 1.
 *   idx >= 5             -> return 0
 *   player == self->b0   -> return 0
 *   subrow.f30 == 0      -> return 0
 *   cf1a4 field == 0     -> return 0
 *   if (self->f6hi == 0) return 1;
 *   return 021c84a8(player,idx) == self->f8
 * f6hi = high byte of u16 at +6 (lsl#16;lsr#24). f8 = u16 at +8. */

struct self_t {
    char _pad[2];
    unsigned short b0 : 1;
    unsigned short _r : 15;
    char _pad6[2];
    unsigned short f6lo : 8;
    unsigned short f6hi : 8;
    unsigned short f8;
};
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a4[];
extern int func_ov002_021c84a8(int player, int idx);

int func_ov002_021eff70(struct self_t *self, int player, int idx) {
    struct subrow *sr;
    if (idx >= 5)
        return 0;
    if (player == self->b0)
        return 0;
    sr = (struct subrow *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    if (self->f6hi == 0)
        return 1;
    return func_ov002_021c84a8(player, idx) == self->f8;
}
