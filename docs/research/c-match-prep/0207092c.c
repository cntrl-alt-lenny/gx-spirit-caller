/* CAMPAIGN-PREP candidate for func_0207092c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global->ctx deref, NULL guard, byte-flag branch to two void tail calls
 *   risk:       offsets 0x4/0xa4/0x9 guessed; helpers truly void-arg assumed; branch sense (f9 true->b38) per beq fallthrough
 *   confidence: med
 */
/* func_0207092c (main, class A): global->ctx deref, NULL guard, then a
 * byte flag (+0x9) chooses one of two void calls. Saves {lr}+4.
 *
 *   ctx = *(T**)(data_021a63d0 + 0x4) -> ->field_a4
 *   if(!ctx) return;
 *   if(ctx->f9) func_02074b38(); else func_02070980();
 *
 * The two helpers are called with no args (r0..r3 not set up before
 * either bl), so they take void here. f9 is a byte (ldrb).
 */

struct Ctx0207092c {
    char _pad[0x9];
    unsigned char f9;       /* +0x9 ldrb flag */
};
struct Root0207092c {
    char _pad04[0x4];
    struct Ctx0207092c *p4; /* +0x4 */
};
struct Mid0207092c {
    char _padA4[0xa4];
    struct Ctx0207092c *ctx; /* +0xa4 */
};

extern char data_021a63d0[];
extern void func_02074b38(void);
extern void func_02070980(void);

void func_0207092c(void)
{
    struct Ctx0207092c *ctx;

    ctx = ((struct Mid0207092c *)
               ((struct Root0207092c *)data_021a63d0)->p4)->ctx;
    if (ctx == 0)
        return;

    if (ctx->f9)
        func_02074b38();
    else
        func_02070980();
}
