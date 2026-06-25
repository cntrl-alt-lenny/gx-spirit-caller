/* CAMPAIGN-PREP candidate for func_02056a34 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard + MIN-style conditional store (subgt/strgt as if)
 *   risk:       r0 (arg0) unused but must occupy the slot; subgt/strgt fuse depends on -O4 keeping value in r0
 *   confidence: high
 */
/* func_02056a34: tiny leaf. arg0 in r0 is unused; arg1=p, arg2=thr.
 *   ldr r1,[r1,#8]; cmp r1,#0; beq end
 *   ldr r0,[r1]; cmp r0,r2; subgt r0,r0,#1; strgt r0,[r1]
 *   end: mov r0,#1; bx lr
 */

typedef struct {
    char _pad_00[0x8];
    int  count;      /* +0x8 -> pointer to sub-struct */
} Outer;

typedef struct {
    int value;       /* +0x0 */
} Inner;

int func_02056a34(void *unused, Outer *p, int thr) {
    Inner *q = (Inner *)p->count;
    if (q != 0) {
        if (q->value > thr) {
            q->value = q->value - 1;
        }
    }
    return 1;
}
