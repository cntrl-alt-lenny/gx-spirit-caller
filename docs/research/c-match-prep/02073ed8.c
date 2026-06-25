/* CAMPAIGN-PREP candidate for func_02073ed8 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     flag-default-1 + && short-circuit; CSE mask; != -> movne
 *   risk:       -1 compare may emit cmn vs orig mvn;cmp; movne/result-in-ip placement could flip
 *   confidence: med
 */
/* func_02073ed8: same-subnet / loopback address predicate.
 * Returns 1 for the broadcast (0xffffffff) or loopback (0x7f000001)
 * address, otherwise compares (addr & netmask) == (gateway & netmask).
 * data_0219eee8 = netmask (CSE-loaded once into r3, ANDed with both
 * operands); data_0219ef1c = the comparand address.
 */
extern unsigned data_0219eee8;   /* netmask */
extern unsigned data_0219ef1c;   /* comparand address */

int func_02073ed8(unsigned addr) {
    int result = 1;
    if (addr != 0xffffffffu && addr != 0x7f000001u) {
        if ((addr & data_0219eee8) != (data_0219ef1c & data_0219eee8))
            result = 0;
    }
    return result;
}
