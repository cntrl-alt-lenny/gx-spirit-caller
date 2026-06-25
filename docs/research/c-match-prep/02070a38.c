/* CAMPAIGN-PREP candidate for func_02070a38 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     deref+NULL-guard; unsigned window test (u8)(f8-0xa)<=1; flag dispatch
 *   risk:       func_02070b4c arg setup (asm sets none before its bl) vs its real 2-arg sig; return-value plumbing on call paths; offsets guessed
 *   confidence: low
 */
/* func_02070a38 (main, class A): global->ctx deref then a 3-way
 * dispatch on a byte field (+0x8) plus a byte flag (+0x9). Saves {lr}+4.
 *
 *   ctx = *(T**)(data_021a63d0 + 0x4) -> ->field_a4
 *   if(!ctx) { *out = 0; return 0; }            (.L_e38; r0 is out ptr)
 *   k = (unsigned char)(ctx->f8 + 0xf6);         add then &0xff
 *   if(k <= 1) { func_02070b4c(); return; }       f8 in {0x0a,0x0b}
 *   if(ctx->f9) { func_02074b90(); return; }
 *   func_02070ac0();
 *
 * `ldrb; add #0xf6; and #0xff; cmp #1; bhi` is the unsigned-window test
 * (ctx->f8 == 0x0a || 0x0b), i.e. ((u8)(f8 - 0x0a)) <= 1. On the null
 * path r0 (the incoming arg, an out-pointer) gets *r0 = 0 and return 0.
 */

struct Ctx02070a38 {
    char _pad[0x8];
    unsigned char f8;       /* +0x8 */
    unsigned char f9;       /* +0x9 */
};
struct Root02070a38 {
    char _pad04[0x4];
    struct Ctx02070a38 *p4; /* +0x4 */
};
struct Mid02070a38 {
    char _padA4[0xa4];
    struct Ctx02070a38 *ctx; /* +0xa4 */
};

extern char data_021a63d0[];
extern void func_02070b4c(void *out, void *ctx);
extern void func_02074b90(void);
extern void func_02070ac0(void);

int func_02070a38(int *out)
{
    struct Ctx02070a38 *ctx;

    ctx = ((struct Mid02070a38 *)
               ((struct Root02070a38 *)data_021a63d0)->p4)->ctx;
    if (ctx == 0) {
        *out = 0;
        return 0;
    }

    if ((unsigned char)(ctx->f8 - 0x0a) <= 1) {
        func_02070b4c();
        return 0;
    }
    if (ctx->f9) {
        func_02074b90();
        return 0;
    }
    func_02070ac0();
    return 0;
}
