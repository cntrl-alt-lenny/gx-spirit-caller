/* CAMPAIGN-PREP candidate for func_020517a0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear init: repeated RELOAD + zero-stores in store-order; Fill helper; stacked args
 *   risk:       ASM IS TRUNCATED in batch (76 lines, ends mid-body) — tail stores+epilogue/routing UNKNOWN; offsets/Fill32 sig guessed
 *   confidence: low
 */
/* func_020517a0 -> src/main/func_020517a0.c  (PARTIAL: source asm truncated)
 * Visible body only. push{r4,r5,r6,lr}; args: r0 unused, r1->[0], r2->[0x4], r3->[0x8],
 * then stacked args at [sp,#0x10..0x1c] = a5..a8 stored to 0x2f4..0x300.
 * Tail beyond func_020945f4(base+0x304,0,0x40) is CUT OFF -> cannot complete. */
typedef struct State State;
extern State *func_020498f0(void);
extern void  func_02049900(void);
extern void  func_020498dc(int);
extern void  func_0204b370(void);     /* declared in batch externs */
extern void  func_0204f3c0(void);     /* declared in batch externs */
extern void  func_020945f4(void *dst, int val, int n);  /* memset-like */

void func_020517a0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8) {
    (void)a1;
    func_02049900();
    *(int *)((char *)func_020498f0() + 0x0)   = a2;
    *(int *)((char *)func_020498f0() + 0x4)   = a3;
    *(int *)((char *)func_020498f0() + 0x8)   = a4;
    *(int *)((char *)func_020498f0() + 0x10)  = 0;
    *(int *)((char *)func_020498f0() + 0x1c)  = 0;
    *(short *)((char *)func_020498f0() + 0x1a) = 0;
    *(int *)((char *)func_020498f0() + 0xe4)  = 0;
    func_020498dc(0);
    *(char *)((char *)func_020498f0() + 0xf)   = 0;
    *(char *)((char *)func_020498f0() + 0x19)  = 0;
    *(char *)((char *)func_020498f0() + 0x1af) = 0;
    *(short *)((char *)func_020498f0() + 0x100 + 0xb6) = 0;  /* add r0,#0x100; strh [r0,#0xb6] */
    *(int *)((char *)func_020498f0() + 0x1dc)  = 0;
    *(int *)((char *)func_020498f0() + 0x200)  = 0;
    *(int *)((char *)func_020498f0() + 0x2f4)  = a5;
    *(int *)((char *)func_020498f0() + 0x2f8)  = a6;
    *(int *)((char *)func_020498f0() + 0x2fc)  = a7;
    *(int *)((char *)func_020498f0() + 0x300)  = a8;
    func_020945f4((char *)func_020498f0() + 0x304, 0, 0x40);
    /* TRUNCATED: further func_020498f0 reloads/stores + epilogue not in source. */
}
