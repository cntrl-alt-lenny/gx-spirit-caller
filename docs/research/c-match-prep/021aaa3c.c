/* CAMPAIGN-PREP candidate for func_021aaa3c (ov018, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     tst flag->bool 0xff/0, pack into packed-arg, tail bx helper
 *   risk:       asr#0xc + tst#2 + the (bool<<16)>>16 zero-extend chain; packed = (scale<<16)|0xc field order; data deref
 *   confidence: med
 */
/* func_ov018_021aaa3c: read the global brightness flag (bit 1 of
 * data_ov018_021ad860[0x9cc] >> 12) as 0xff/0, then brighten a run of 0xc
 * RGB555 cells at data_ov018_021ad8a8 + 0x966 in place (count=0xc,
 * scale=the flag) via func_ov018_021ad1f4. Tail call.
 */

extern char data_ov018_021ad860[];
extern char data_ov018_021ad8a8[];
extern void func_ov018_021ad1f4(unsigned short *src, unsigned short *dst, unsigned int packed);

void func_ov018_021aaa3c(unsigned short *src) {
    int scale = ((*(int *)(data_ov018_021ad860 + 0x9cc) >> 12) & 2) ? 0xff : 0;
    func_ov018_021ad1f4((unsigned short *)(data_ov018_021ad8a8 + 0x966), src,
                        ((unsigned short)scale << 16) | 0xc);
}
