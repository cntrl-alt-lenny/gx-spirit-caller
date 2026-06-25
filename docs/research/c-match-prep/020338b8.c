/* CAMPAIGN-PREP candidate for func_020338b8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guarded call (>1) + multi-bit clear (chained bic via single mask)
 *   risk:       bic decomposition order (0x2000,0x1000,0x4000,0x10000,0x40000) must match; func_02046ae0 arg may be unused
 *   confidence: med
 */
/* func_020338b8 — guarded call then mask-clear flags */

typedef struct {
    unsigned char _pad_00[0xeb4];
    unsigned int flags;   /* +0xeb4 */
} Obj_020338b8;

extern int  func_02046ae0(Obj_020338b8 *p);
extern void func_02033864(Obj_020338b8 *p);

void func_020338b8(Obj_020338b8 *p)
{
    if (func_02046ae0(p) > 1)
        func_02033864(p);
    p->flags &= ~(0x2000 | 0x1000 | 0x4000 | 0x10000 | 0x40000);
}
