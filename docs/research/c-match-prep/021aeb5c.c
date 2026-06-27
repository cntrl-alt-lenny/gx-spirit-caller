/* CAMPAIGN-PREP candidate for func_021aeb5c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     field-pack into a word + counter post-increment store-order; halfword RMW low-13 mask; index derived from packed word
 *   risk:       permuter-class: orig recycles r4=0 to materialize masks (-0x2000=0xffffe000, bic#0x2000) and re-derives idx2 by re-shifting the packed word (lsl#2;lsr#0x18 / lsl#0x12;lsr#0x1f); mwcc will rematerialize consts and reorder -- heavy reg/scheduling divergence.
 *   confidence: low
 */
/* func_ov002_021aeb5c: read counter CF[(arg0&1)*0x868], pack a word L =
 * (arg1&0x1fff) | ((arg0&1)<<13) | ((CF_byte&0xff)<<22), store L to a stack
 * local; write CF[idx]=counter+1; then replace low 13 bits of a halfword in
 * D0 (indexed by ((CF_byte<<1)+bit13_of_L)<<2) with arg1&0x1fff. No calls.
 * Dense register-recycle; ship-as-.s if it will not converge.
 *
 *   and r5,r0,#1; mul ip,r5,#0x868            ; idx = (arg0&1)*0x868
 *   r5=arg0<<0x1f; ... orr (arg0bit0)<<13 ; ldr r3,[CF,ip] ; and arg1&0x1fff ; orr
 *   bic r7,#0x3fc00000; r0=r3<<0x18; orr r7,(CF&0xff)<<22  -> L
 *   add r2,r3,#1; str r4(=0)[sp]; str r2,[CF,ip]; str L,[sp]
 *   ... ldrh ip,[D0, idx2]; and ip,#0xffffe000; orr arg1&0x1fff; strh
 */

extern unsigned int  data_ov002_022cf170[];   /* CF: counter table, stride 0x868 */
extern unsigned short data_ov002_022d0250[];   /* D0: halfword table          */

void func_ov002_021aeb5c(unsigned int arg0, unsigned int arg1) {
    unsigned int slot = arg0 & 1;
    unsigned int *cnt = &data_ov002_022cf170[slot * (0x868 / 4)];
    unsigned int counter = *cnt;
    unsigned int local;
    unsigned int idx2;

    local = (arg1 & 0x1fff)
          | ((arg0 & 1) << 13)
          | ((counter & 0xff) << 22);
    *cnt = counter + 1;
    local = local;            /* L written to stack scratch (sp) */

    idx2 = (((local >> 22) & 0xff) << 1) | ((local >> 13) & 1);
    data_ov002_022d0250[idx2] =
        (unsigned short)((data_ov002_022d0250[idx2] & 0xe000) | (arg1 & 0x1fff));
}
