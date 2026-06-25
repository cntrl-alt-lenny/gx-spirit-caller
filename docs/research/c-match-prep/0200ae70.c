/* CAMPAIGN-PREP candidate for func_0200ae70 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard early-return + 8x unrolled guarded-invoke (explicit fields, not a loop)
 *   risk:       low — offsets 0x0..0x1c are contiguous and certain; must stay unrolled (no for-loop)
 *   confidence: high
 */
/* func_0200ae70 — null-guard then 8 unrolled null-checked invokes on fields 0x0..0x1c. */

extern void Task_InvokeLocked(void *t);

typedef struct {
    void *f00, *f04, *f08, *f0c, *f10, *f14, *f18, *f1c;
} Obj2;

int func_0200ae70(Obj2 *p)
{
    if (!p)
        return 0;
    if (p->f00) Task_InvokeLocked(p->f00);
    if (p->f04) Task_InvokeLocked(p->f04);
    if (p->f08) Task_InvokeLocked(p->f08);
    if (p->f0c) Task_InvokeLocked(p->f0c);
    if (p->f10) Task_InvokeLocked(p->f10);
    if (p->f14) Task_InvokeLocked(p->f14);
    if (p->f18) Task_InvokeLocked(p->f18);
    if (p->f1c) Task_InvokeLocked(p->f1c);
    return 1;
}
