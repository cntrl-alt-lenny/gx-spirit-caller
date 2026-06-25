/* CAMPAIGN-PREP candidate for func_0208b0d0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     RELOAD store-then-copy (zero via field reload), store order
 *   risk:       mwcc may CSE the reload back to the zero constant (dropping the ldr); volatile not warranted so reload is fragile
 *   confidence: med
 */
/* func_0208b0d0 — zero two pairs of fields via the RELOAD idiom: store
 * 0 to +0x4 then copy +0x4 -> +0x0; store 0 to +0xc then copy +0xc ->
 * +0x8. The copies reload the just-zeroed field rather than reusing the
 * zero register, so the C reads the field back explicitly.
 *
 *   mov r2,#0
 *   str r2,[r0,#0x4]; ldr r1,[r0,#0x4]; str r1,[r0,#0x0]
 *   str r2,[r0,#0xc]; ldr r1,[r0,#0xc]; str r1,[r0,#0x8]
 *   bx lr
 *
 * Writing `p->f0 = 0; p->f4 = 0;` would fold to two stores of one zero
 * reg; the orig's reload pattern requires `p->f4 = 0; p->f0 = p->f4;`
 * (store-then-reload) to reproduce the ldr between stores.
 */
#include <nitro/types.h>

typedef struct S_0208b0d0 {
    s32 f0;   /* +0x00 */
    s32 f4;   /* +0x04 */
    s32 f8;   /* +0x08 */
    s32 fc;   /* +0x0c */
} S_0208b0d0;

void func_0208b0d0(S_0208b0d0 *p) {
    p->f4 = 0;
    p->f0 = p->f4;
    p->fc = 0;
    p->f8 = p->fc;
}
