/* CAMPAIGN-PREP candidate for func_0208b300 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ldm/stm matrix transpose copy + zero tail
 *   risk:       mwcc almost never emits the interleaved ldmia/stmia from element copies; reg-alloc and store blocking will differ -> likely ship .s
 *   confidence: low
 */
/* func_0208b300 — copy a 3x3 matrix from src (r0) to dst (r1) with a
 * transpose-style reinterleave, then zero the 3-word tail (dst[9..11]).
 *
 *   ldmia r0,{r2,r3,r4,r5,r6,r7,r8,r9,ip}      ; src[0..8]
 *   stmia r1!,{r2,r5,r8}  -> dst[0]=s0,dst[1]=s3,dst[2]=s6
 *   stmia r1!,{r3,r6,r9}  -> dst[3]=s1,dst[4]=s4,dst[5]=s7
 *   stmia r1!,{r4,r7,ip}  -> dst[6]=s2,dst[7]=s5,dst[8]=s8
 *   dst[9]=dst[10]=dst[11]=0
 *
 * stmia stores registers in ascending register order, so the visible
 * permutation is the 3x3 transpose (dst[r][c]=src[c][r]). This is
 * matrix/transpose territory (likely an MTX_Transpose-style helper);
 * plain element assignment is the closest C but the exact ldm/stm
 * blocking is hard to force.
 */
#include <nitro/types.h>

typedef struct Mtx33_0208b300 { s32 m[9]; } Mtx33_0208b300;
typedef struct Mtx43_0208b300 { s32 m[12]; } Mtx43_0208b300;

void func_0208b300(const Mtx33_0208b300 *src, Mtx43_0208b300 *dst) {
    dst->m[0] = src->m[0];
    dst->m[1] = src->m[3];
    dst->m[2] = src->m[6];
    dst->m[3] = src->m[1];
    dst->m[4] = src->m[4];
    dst->m[5] = src->m[7];
    dst->m[6] = src->m[2];
    dst->m[7] = src->m[5];
    dst->m[8] = src->m[8];
    dst->m[9]  = 0;
    dst->m[10] = 0;
    dst->m[11] = 0;
}
