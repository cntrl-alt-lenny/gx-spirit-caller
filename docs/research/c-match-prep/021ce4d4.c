/* CAMPAIGN-PREP candidate for func_021ce4d4 (ov011, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     field RMW in STORE-ORDER; and+orr mask; single base bind
 *   risk:       Scheduling of the three stores / interleave of the [0x2b0] load may reorder; 0xffe01fff stays a pool word. Offsets guessed from asm.
 *   confidence: med
 */
/* func_ov011_021ce4d4: three field RMWs on data_021d4000 in store order:
 *   [0x2a4] |= 0x10;  [0x2c4] = 0;  [0x2b0] = ([0x2b0] & 0xffe01fff) | 0x8000
 * Base held in one reg across all accesses (single pool word). */
extern unsigned char data_ov011_021d4000[];

void func_ov011_021ce4d4(void) {
    unsigned char *b = data_ov011_021d4000;
    *(unsigned int *)(b + 0x2a4) |= 0x10;
    *(unsigned int *)(b + 0x2c4) = 0;
    *(unsigned int *)(b + 0x2b0) = (*(unsigned int *)(b + 0x2b0) & 0xffe01fffu) | 0x8000;
}
