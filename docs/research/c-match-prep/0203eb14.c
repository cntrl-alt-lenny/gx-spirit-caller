/* CAMPAIGN-PREP candidate for func_0203eb14 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     unsigned clamp (movhi), shift-build mask orr (value-first), strh
 *   risk:       idx must be unsigned for movhi (else movgt); orr operand order needs existing value first; halfword field at base+0xd16; func_0203c900 retyped char*.
 *   confidence: high
 */
/* func_0203eb14: clamp idx to 0xd (unsigned, movhi), then set bit
 * (idx-1) in the u16 at base+0xd00+0x16. base=func_0203c900(0x10).
 */
extern char *func_0203c900(int sel);

void func_0203eb14(unsigned int idx)
{
    char *p = func_0203c900(0x10) + 0xd00;
    if (idx > 0xd) idx = 0xd;
    *(unsigned short *)(p + 0x16) =
        *(unsigned short *)(p + 0x16) | (1 << (idx - 1));
}
