/* CAMPAIGN-PREP candidate for func_0204f9cc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     32-bit bit-scan count loop (RELOAD global accessor), leaf
 *   risk:       func_020498f0 reloaded every iter (matches asm); field 0x2f0 int, 0xe byte; ands+addne order
 *   confidence: med
 */
/* func_0204f9cc -> src/main/func_0204f9cc.c (mwcc 2.0/sp1p5 default; push{r4,r5,r6,lr}/pop pc) */
typedef struct {
    char _pad[0x2f0];
    unsigned int mask;   /* +0x2f0 */
} State;
extern State *func_020498f0(void);

void func_0204f9cc(void) {
    int count = -1;   /* mvn r6,#0 ; addne r6,r6,#1 per set bit */
    int i;
    for (i = 0; i < 0x20; i++) {
        if ((1u << i) & func_020498f0()->mask)
            count++;
    }
    if (count == -1)
        *(unsigned char *)((char *)func_020498f0() + 0xe) = 0;
    else
        *(unsigned char *)((char *)func_020498f0() + 0xe) = (unsigned char)count;
}
