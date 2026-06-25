/* CAMPAIGN-PREP candidate for func_021b3f34 (ov019, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     C-43 packed stack-local struct builder, sibling of 021b3f00; tail call to 021b3e38
 *   risk:       helper signature/arg count for func_ov019_021b3e38 must match; u16 pad gaps at 4/0xa assumed; reg temps may flip
 *   confidence: med
 */
/* func_ov019_021b3f34: packed stack-local struct builder (sibling of 021b3f00).
 * Copies halfwords from the source struct r3, biasing h0 by stack-arg A and
 * h2 by stack-arg B, then tail-calls func_ov019_021b3e38(a0,a1,a2,&local).
 *
 *   ldrh r4,[r3] ; ldr lr,[sp,#0x18] ; ldr ip,[sp,#0x1c]
 *   add r4,r4,lr ; strh r4,[sp]
 *   ldrh lr,[r3,#2] ; add ip,lr,ip ; strh ip,[sp,#2]
 *   ldrh ip,[r3,#6] ; strh ip,[sp,#6]
 *   ldrh ip,[r3,#8] ; strh ip,[sp,#8] ; bl func_ov019_021b3e38
 */

typedef unsigned short u16;

struct P021b3f34 {
    u16 f0;
    u16 f2;
    u16 gap4;
    u16 f6;
    u16 f8;
};

typedef struct {
    u16 h0;
    u16 h2;
    u16 h4;
    u16 h6;
    u16 h8;
} Pt021b3e38;

extern void func_ov019_021b3e38(int a0, int a1, int a2, void *p);

void func_ov019_021b3f34(int a0, int a1, int a2, Pt021b3e38 *src, int A, int B) {
    struct P021b3f34 local;
    local.f0 = src->h0 + A;
    local.f2 = src->h2 + B;
    local.f6 = src->h6;
    local.f8 = src->h8;
    func_ov019_021b3e38(a0, a1, a2, &local);
}
