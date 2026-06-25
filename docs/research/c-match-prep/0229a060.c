/* CAMPAIGN-PREP candidate for func_0229a060 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     mask+shift extract, signed >0 guard, u16 table lookup
 *   risk:       mask+shift may fold to a :N bitfield; data_02104f4c must reload (single deref) not bind
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229a060 (ov002, class B).
 *   recipe:  mask+shift bitfield extract (>>20 &0x1f), signed >0 guard,
 *            halfword table lookup at (count-1)*2, eq->1 else 0
 *   risk:    'and #0x1f00000;lsr#20' may emit as a :N bitfield instead of
 *            mask+shift; global must be RELOADED (single deref) not bound
 *   confidence: med
 */

extern unsigned int data_02104f4c[];        /* word @ +0xa64 holds the field */
extern unsigned short data_ov002_022ca370[]; /* halfword table */

int func_ov002_0229a060(int key)
{
    int count = (int)((data_02104f4c[0xa64 / 4] & 0x1f00000) >> 20);
    if (count > 0) {
        if (key == data_ov002_022ca370[count - 1])
            return 1;
    }
    return 0;
}
