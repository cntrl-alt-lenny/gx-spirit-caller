/* CAMPAIGN-PREP candidate for func_021b6d00 (ov006, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ACCESSOR + predicated if/else; offset auto-split add+ldrh
 *   risk:       mwcc may hoist the common +0xc600 to one unconditional add instead of duplicating it per predicate.
 *   confidence: high
 */
/* func_ov006_021b6d00: leaf accessor. base + i*2, then a u16 load at
 * either +0xc66c (flag set) or +0xc662 (flag clear). The +0xc600 part is
 * the rot-8 encodable piece mwcc splits off, leaving the 8-bit ldrh offset
 * (0x6c / 0x62). The two loads are predicated (addne/ldrneh, addeq/ldreqh),
 * so write each branch to compute the whole offset independently. */

unsigned short func_ov006_021b6d00(char *base, int i, int flag) {
    char *p = base + i * 2;
    if (flag)
        return *(unsigned short *)(p + 0xc66c);
    else
        return *(unsigned short *)(p + 0xc662);
}
