/* CAMPAIGN-PREP candidate for func_02005188 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D bitfield: lsl#0xb;lsr#0x1c => (x<<11)>>28 unsigned 4-bit extract
 *   risk:       5 stack args (4,5 reloaded from [sp,#0x18/#0x1c]) + fnptr in 3rd slot are guessed marshalling; arg layout struct-guessed, may need an explicit-stack-arg wrapper.
 *   confidence: low
 */
/* func_02005188: extract 4-bit field (bits17-20) from s->field24,
 * store to global[0x8], then tail-ish call func_02004ef4 with two
 * stack args reloaded from caller frame + a function pointer.
 *
 *     ldr r4,[r0,#0x24]; mov r4,r4,lsl#0xb; mov lr,r4,lsr#0x1c
 *     str lr,[ip,#0x8]   (ip = data_02102c7c)
 *     ldr r4,[sp,#0x18]; ldr lr,[sp,#0x1c]  (incoming stack args 4,5)
 *     stmia sp,{r4,lr}; str func_02003f1c,[sp,#0x8]
 *     bl func_02004ef4
 */
typedef struct {
    char _pad_00[0x24];
    unsigned int field24;   /* bits 17..20 = 4-bit field */
} Obj_02005188;

typedef struct {
    char _pad_00[0x8];
    unsigned int sel;       /* +0x8 */
} Glob_02102c7c;

extern Glob_02102c7c data_02102c7c;
extern void func_02003f1c(void);
extern void func_02004ef4(int a0, int a1, void *fn, int a3, int a4);

void func_02005188(Obj_02005188 *obj, int a1, int a2, int a3, int a4) {
    data_02102c7c.sel = (obj->field24 << 0xb) >> 0x1c;
    func_02004ef4(a3, a4, func_02003f1c, a3, a4);
}
