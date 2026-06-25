/* CAMPAIGN-PREP candidate for func_021cefb4 (ov011, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ldrh->u16<<12 into temps; scatter stores in STORE-ORDER; bic mask
 *   risk:       Store scheduling and the 0x254=0x1000 placement may reorder; mwcc could reload h0/h1 instead of holding them. Field offsets inferred.
 *   confidence: med
 */
/* func_ov011_021cefb4: read two u16s from data_021d33bc (+0x52,+0x54),
 * <<12, and scatter into data_021d4000 fields in the asm's store order:
 *   h0=[33bc+0x52]<<12; h1=[33bc+0x54]<<12;
 *   [4000+0x258]=h0; [4000+0x25c]=h1; [4000+0x254]=0x1000;
 *   [4000+0x2ac] &= ~0x20000;  [4000+0x26c]=h0; [4000+0x270]=h1
 */
extern unsigned char data_ov011_021d33bc[];
extern unsigned char data_ov011_021d4000[];

void func_ov011_021cefb4(void) {
    unsigned char *s = data_ov011_021d33bc;
    unsigned char *d = data_ov011_021d4000;
    int h0 = *(unsigned short *)(s + 0x52) << 12;
    int h1 = *(unsigned short *)(s + 0x54) << 12;
    *(int *)(d + 0x258) = h0;
    *(int *)(d + 0x25c) = h1;
    *(int *)(d + 0x254) = 0x1000;
    *(int *)(d + 0x2ac) &= ~0x20000;
    *(int *)(d + 0x26c) = h0;
    *(int *)(d + 0x270) = h1;
}
