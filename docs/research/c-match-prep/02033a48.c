/* CAMPAIGN-PREP candidate for func_02033a48 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard (ldmneia) + long long r0:r1 split-store + nested-base bind
 *   risk:       func_020930b0 paired return modeled as long long; field/sub offsets guessed; sub-base bind ordering before call uncertain
 *   confidence: low
 */
/* func_02033a48 — guard, then store a paired return + two args */

typedef struct {
    unsigned char _pad_00[0xc04];
    int c04;              /* +0xc04 */
    int c08;              /* +0xc08 */
    int c0c;              /* +0xc0c */
} Sub_02033a48;

typedef struct {
    unsigned char _pad_00[0x314];
    Sub_02033a48 sub;     /* +0x314; sub.c04 -> 0xf18 */
    unsigned char _pad_f10[0xf14 - (0x314 + 0xc04 + 4 + 4 + 4)];
    int f14;              /* +0xf14 */
} Obj_02033a48;

extern int       func_020338f8(Obj_02033a48 *p);
extern long long func_020930b0(void);

void func_02033a48(Obj_02033a48 *p, int a, int b)
{
    long long v;
    if (func_020338f8(p))
        return;
    v = func_020930b0();
    p->f14 = (int)v;
    p->sub.c04 = (int)((unsigned long long)v >> 32);
    p->sub.c08 = a;
    p->sub.c0c = b;
}
