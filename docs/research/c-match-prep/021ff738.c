/* CAMPAIGN-PREP candidate for func_021ff738 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     field6 guard; sink; per-player 0x868 table; helper2
 *   risk:       forward-ref to F021ff738_Self in externs; mul-vs-shift for *0x868; 021ff3bc 2-arg prototype
 *   confidence: high
 */
/* func_ov002_021ff738: field6==0x23 skips the 021bb91c(0xfe4) gate; then
 * 021ff3bc(self,arg1)!=0; then per-player 0x868 table word (cf17c) nonzero ->
 * 1, else helper2(bit0, f0, 0)!=0. f2 reloaded for the table index. */

extern char data_ov002_022cf17c[];
extern int  func_ov002_021bb91c(int code);
extern int  func_ov002_021ff3bc(struct F021ff738_Self *self, int arg1);
extern int  func_ov002_022536e8(unsigned int bit, unsigned int f0, unsigned int z);

struct F021ff738_F2 {
    unsigned short b0     : 1;
    unsigned short        : 5;
    unsigned short field6 : 6;
    unsigned short        : 4;
};
struct F021ff738_Self {
    unsigned short f0;
    struct F021ff738_F2 f2;
};

int func_ov002_021ff738(struct F021ff738_Self *self, int arg1) {
    if (self->f2.field6 != 0x23) {
        if (func_ov002_021bb91c(0xfe4) == 0) return 0;
    }
    if (func_ov002_021ff3bc(self, arg1) == 0) return 0;
    if (*(int *)(data_ov002_022cf17c + (self->f2.b0 & 1) * 0x868) != 0)
        return 1;
    return func_ov002_022536e8(self->f2.b0, self->f0, 0) != 0;
}
