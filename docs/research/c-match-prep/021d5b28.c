/* CAMPAIGN-PREP candidate for func_021d5b28 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     byte-pack args via (u8)lo|((u8)hi<<8), u16-truncate, nested counted double loop
 *   risk:       loop-invariant packed(r8) and constant 1(r4) hoisted to callee-saved regs; mwcc may not hoist the literal 1, or pick other regs
 *   confidence: med
 */
/* func_ov002_021d5b28: pack (lo,hi) bytes into a u16 and replay it across a
 * 2 x 11 grid via func_021d5ab4(i, j, packed, 1). */
extern void func_ov002_021d5ab4(int a, int b, unsigned short packed, int flag);

void func_ov002_021d5b28(int lo, int hi) {
    unsigned short packed = (unsigned short)(((unsigned char)lo) |
                                             (((unsigned char)hi) << 8));
    int i, j;
    for (i = 0; i < 2; i++)
        for (j = 0; j <= 10; j++)
            func_ov002_021d5ab4(i, j, packed, 1);
}
