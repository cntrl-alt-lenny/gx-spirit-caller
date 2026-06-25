/* CAMPAIGN-PREP candidate for func_021ff5e4 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     per-player 0x868 index (mul); bitfield gates; reload
 *   risk:       mul-vs-shift for *0x868; the (w>>17)&1 tst form; multi5 reload may CSE instead of re-ldrh
 *   confidence: med
 */
/* func_ov002_021ff5e4: per-player 0x868-stride table word, test bit17; then
 * 021bc618(bit0)!=0; then multi5<=0xa -> 1 else 021bd030(bit0)>=0. The table
 * index uses (bit0 & 1); the call args use bare bit0. f2 reloaded after the
 * call (separate ldrh in orig). */

extern char data_ov002_022cf288[];
extern int  func_ov002_021bc618(unsigned int bit0);
extern int  func_ov002_021bd030(unsigned int bit0);

struct F021ff5e4_F2 {
    unsigned short b0     : 1;
    unsigned short multi5 : 5;
    unsigned short        : 10;
};
struct F021ff5e4_Self {
    unsigned short f0;
    struct F021ff5e4_F2 f2;
};

int func_ov002_021ff5e4(struct F021ff5e4_Self *self) {
    unsigned int w = *(unsigned int *)(data_ov002_022cf288 +
                                       (self->f2.b0 & 1) * 0x868);
    if ((w >> 17) & 1) return 0;
    if (func_ov002_021bc618(self->f2.b0) == 0) return 0;
    if (self->f2.multi5 <= 0xa) return 1;
    if (func_ov002_021bd030(self->f2.b0) < 0) return 0;
    return 1;
}
