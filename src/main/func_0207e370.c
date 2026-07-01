/* CAMPAIGN-PREP candidate for func_0207e370 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     SETTER + call + GUARD early-return + two ordered pointer-slot stores
 *   risk:       arg0/flag types guessed; pool/literal ordering and the early-return merge (ldmeqia) must match
 *   confidence: high
 */
/* func_0207e370: store arg into allocator base, reset, then on a flag
 * install two function-pointer slots.
 *
 *   stmdb sp!, {r4, lr}
 *   ldr  r2, =data_021a08e4
 *   mov  r4, r1               ; cache flag
 *   str  r0, [r2, #0x8]       ; g.base = size
 *   bl   func_0207e214        ; reset allocator
 *   cmp  r4, #0x0
 *   ldmeqia sp!, {r4, pc}     ; flag==0 -> return
 *   ldr  r3, =func_0207e238
 *   ldr  r1, =data_021020fc
 *   ldr  r2, =func_0207e230
 *   ldr  r0, =data_02102100
 *   str  r3, [r1]             ; data_021020fc = func_0207e238
 *   str  r2, [r0]             ; data_02102100 = func_0207e230
 *   ldmia sp!, {r4, pc}
 *
 * data_021020fc / data_02102100 are void* slots (see their data .c).
 */

typedef struct {
    int cur;   /* +0x0 */
    int end;   /* +0x4 */
    int base;  /* +0x8 */
} Heap0207e370;

extern Heap0207e370 data_021a08e4;
extern void *data_021020fc;
extern void *data_02102100;
extern void  func_0207e214(void);
extern int   func_0207e238();
extern int   func_0207e230(void);

void func_0207e370(int size, int flag) {
    data_021a08e4.base = size;
    func_0207e214();
    if (flag != 0) {
        data_021020fc = (void *)func_0207e238;
        data_02102100 = (void *)func_0207e230;
    }
}
