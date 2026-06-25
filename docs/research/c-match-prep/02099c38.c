/* CAMPAIGN-PREP candidate for func_02099c38 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     volatile MMIO accessor in spin loop; AND operand-order (field first)
 *   risk:       without volatile mwcc would hoist the load; pool-word vs neighbor unaffected. Reload should match.
 *   confidence: high
 */
/* func_02099c38: MMIO poll-spin. Re-reads u16 at offset 0x36 of the
 * data_021a8394 register block and busy-waits while (reg & mask) != 0.
 * Sibling of func_02099c24 (offset 0x34, same block). The cast must be
 * volatile so mwcc re-emits the ldrh each iteration (base ldr is hoisted).
 */

extern char data_021a8394[];

void func_02099c38(unsigned int mask) {
    while (*(volatile unsigned short *)(data_021a8394 + 0x36) & mask)
        ;
}
