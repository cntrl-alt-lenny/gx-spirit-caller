/* CAMPAIGN-PREP candidate for func_0207034c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global->ptr->ctx deref chain, double NULL guard, call, field-clear
 *   risk:       struct offsets (0x4/0xa4/0x5c/0x60) guessed from asm; f5c/f60 types int vs ptr; r4 reuse should hold
 *   confidence: med
 */
/* func_0207034c (main, class A): global -> ctx deref, two NULL guards,
 * one call, then clears a field. Saves {r4,lr}; r4 holds ctx.
 *
 *   ctx = *(T**)(data_021a63d0 + 0x4) -> ->field_a4
 *   if(!ctx) return;
 *   if(!ctx->f60) return;
 *   func_020704e8(ctx->f5c, 0, 0);
 *   ctx->f60 = 0;
 *
 * data_021a63d0+0x4 is a pointer-to-struct; +0xa4 is the active ctx.
 * The ctx base (r4) is callee-saved and reused for f60/f5c. f60 is
 * guarded then zeroed (load, then store 0 at same offset).
 */

struct Ctx0207034c {
    char _pad[0x5c];
    void *f5c;          /* +0x5c -> arg0 of call */
    int   f60;          /* +0x60 -> guard, then cleared */
};
struct Root0207034c {
    char _pad04[0x4];
    struct Ctx0207034c *p4;   /* data_021a63d0 + 0x4 */
};
struct Mid0207034c {
    char _padA4[0xa4];
    struct Ctx0207034c *ctx;  /* +0xa4 */
};

extern char data_021a63d0[];
extern void func_020704e8(void *p, int a, int b);

void func_0207034c(void)
{
    struct Ctx0207034c *ctx;

    ctx = ((struct Mid0207034c *)
               ((struct Root0207034c *)data_021a63d0)->p4)->ctx;
    if (ctx == 0)
        return;
    if (ctx->f60 == 0)
        return;

    func_020704e8(ctx->f5c, 0, 0);
    ctx->f60 = 0;
}
