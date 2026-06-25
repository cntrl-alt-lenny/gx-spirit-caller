/* CAMPAIGN-PREP candidate for func_021d48a8 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     4-field u16 setter (store-order) + int OR-flag RMW + low-byte BIC mask + tail-ish call
 *   risk:       the 4 strh may reschedule; `&= ~0xff` must emit bic (not and #0xff00); pool load of cdc6c arg scheduling
 *   confidence: med
 */
/* func_ov002_021d48a8: stash four u16 params into the cdc68 record (+4,+6,+8,
 * +0xa), set bit2 of cd968[+0x300], clear the low byte of cdc68[+0xc], then
 * notify func_0229cd40 with the cdc6c record. */
extern char data_ov002_022cdc68[];
extern char data_ov002_022cd968[];
extern char data_ov002_022cdc6c[];
extern void func_ov002_0229cd40(void *p);

void func_ov002_021d48a8(unsigned short a, unsigned short b,
                         unsigned short c, unsigned short d) {
    *(unsigned short *)(data_ov002_022cdc68 + 0x4) = a;
    *(unsigned short *)(data_ov002_022cdc68 + 0x6) = b;
    *(unsigned short *)(data_ov002_022cdc68 + 0x8) = c;
    *(unsigned short *)(data_ov002_022cdc68 + 0xa) = d;
    *(int *)(data_ov002_022cd968 + 0x300) |= 0x4;
    *(unsigned short *)(data_ov002_022cdc68 + 0xc) &= ~0xff;
    func_ov002_0229cd40(data_ov002_022cdc6c);
}
