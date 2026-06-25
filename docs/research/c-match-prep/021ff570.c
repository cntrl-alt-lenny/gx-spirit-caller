/* CAMPAIGN-PREP candidate for func_021ff570 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain; bind-base; bitfield gate; asym-shift bit-test
 *   risk:       struct offset 0x14 for w14 guessed; bind-vs-reload of d016c base; bitfield-vs-load fold in the two cmps
 *   confidence: med
 */
/* func_ov002_021ff570: arg1 guard, then two d016c scalar checks (base bound
 * once across both loads), field6==0xe gate, final bit0 == bit21(self->w14).
 * Asymmetric (w<<10)>>31 stays raw C (mwcc won't fold unequal shifts). */

extern char data_ov002_022d016c[];

struct F021ff570_F2 {
    unsigned short b0     : 1;
    unsigned short        : 5;
    unsigned short field6 : 6;
    unsigned short        : 4;
};
struct F021ff570_Self {
    unsigned short f0;
    struct F021ff570_F2 f2;
    char _pad[16];
    unsigned int w14;
};

int func_ov002_021ff570(struct F021ff570_Self *self, int arg1) {
    char *base;
    if (arg1 != 0) return 0;
    base = data_ov002_022d016c;
    if (*(int *)(base + 0xcec) == (int)self->f2.b0) return 0;
    if (*(int *)(base + 0xcf8) != 3) return 0;
    if (self->f2.field6 != 0xe) return 0;
    return self->f2.b0 == ((unsigned int)(self->w14 << 10) >> 31);
}
