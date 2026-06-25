/* CAMPAIGN-PREP candidate for func_0220ddac (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global+1<4 guard + guarded call(p) + tail call
 *   risk:       data_ word-index 0x484 type guessed; dd34 arg=p inferred from untouched r0
 *   confidence: med
 */
/* func_ov002_0220ddac — counter guard then two-call chain */

typedef struct Entity Entity;

extern int data_ov002_022ce288[];
extern int func_ov002_0220dd34(Entity *p);
extern int func_ov002_021ff400(Entity *p, int arg);

int func_ov002_0220ddac(Entity *p, int arg)
{
    if (data_ov002_022ce288[0x484 / 4] + 1 < 4)
        return 0;
    if (func_ov002_0220dd34(p) == 0)
        return 0;
    return func_ov002_021ff400(p, arg);
}
