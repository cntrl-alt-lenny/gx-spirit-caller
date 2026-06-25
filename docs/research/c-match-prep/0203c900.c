/* CAMPAIGN-PREP candidate for func_0203c900 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD bit-test chain returning globals (B/commutative ands)
 *   risk:       Each if(flags&bit) must predicate as ands+ldrne/bxne; data_* must be ptr-typed so ldr [addr] (value), not addr, is returned.
 *   confidence: high
 */
/* func_0203c900: bit-test ladder. Tests flags bits 0x1..0x10 in order;
 * on the first set bit, returns the value of the matching global; else 0.
 *   ands rX,r0,#bit ; ldrne addr ; ldrne [addr] ; bxne lr
 */
extern void *data_0219d9b8;
extern void *data_0219d9bc;
extern void *data_0219d9c0;
extern void *data_0219d9c4;
extern void *data_0219d9c8;

void *func_0203c900(int flags)
{
    if (flags & 0x1)  return data_0219d9c8;
    if (flags & 0x2)  return data_0219d9bc;
    if (flags & 0x4)  return data_0219d9c0;
    if (flags & 0x8)  return data_0219d9c4;
    if (flags & 0x10) return data_0219d9b8;
    return 0;
}
