/* CAMPAIGN-PREP candidate for func_0207e288 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     SETTER + call + GUARD early-return + two ordered pointer-slot stores
 *   risk:       arg0/flag types guessed; pool/literal ordering and the early-return merge (ldmeqia) must match
 *   confidence: high
 */
/* func_0207e288: store arg into allocator base, reset, then on a flag
 * install two function-pointer slots.
 *
 *   stmdb sp!, {r4, lr}
 *   ldr  r2, =data_021a0804
 *   mov  r4, r1               ; cache flag
 *   str  r0, [r2, #0x8]       ; g.base = size
 *   bl   func_0207e12c        ; reset allocator
 *   cmp  r4, #0x0
 *   ldmeqia sp!, {r4, pc}     ; flag==0 -> return
 *   ldr  r3, =func_0207e150
 *   ldr  r1, =data_0210201c
 *   ldr  r2, =func_0207e148
 *   ldr  r0, =data_02102020
 *   str  r3, [r1]             ; data_0210201c = func_0207e150
 *   str  r2, [r0]             ; data_02102020 = func_0207e148
 *   ldmia sp!, {r4, pc}
 *
 * data_0210201c / data_02102020 are void* slots (see their data .c).
 */

typedef struct {
    int cur;   /* +0x0 */
    int end;   /* +0x4 */
    int base;  /* +0x8 */
} Heap0207e370;

extern Heap0207e370 data_021a0804;
extern void *data_0210201c;
extern void *data_02102020;
extern void  func_0207e12c(void);
extern int   func_0207e150();
extern int   func_0207e148(void);

void func_0207e288(int size, int flag) {
    data_021a0804.base = size;
    func_0207e12c();
    if (flag != 0) {
        data_0210201c = (void *)func_0207e150;
        data_02102020 = (void *)func_0207e148;
    }
}
