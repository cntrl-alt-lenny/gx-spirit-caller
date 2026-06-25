/* CAMPAIGN-PREP candidate for func_0205d5c8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-struct out-param, callback ptr, conditional clear
 *   risk:       struct layout/field count guessed; the post-call reload-vs-field may flip reg-alloc on r4
 *   confidence: low
 */
/* func_0205d5c8: build a 4-word request record on the stack {arg1, arg2,
 * arg3, 0}, hand it (with the func_0205d614 callback) to func_0205d560,
 * then re-read the 4th word; if func_0205d560 left it 0, null *arg3.
 *
 *   stmdb sp!, {r4, lr}; sub sp,#0x10
 *   str r1,[sp]; mov ip,#0; str r2,[sp,#4]; mov r4,r3
 *   ldr r1,_LIT0(func_0205d614); add r2,sp,#0; str ip,[sp,#0xc]; str r4,[sp,#8]
 *   bl func_0205d560
 *   ldr r0,[sp,#0xc]; cmp r0,#0; moveq r0,#0; streq r0,[r4]
 *   mov r0,#0; add sp,#0x10; ldmia sp!, {r4, pc}
 */
typedef struct {
    void *a;       /* +0x0 = arg1 */
    void *b;       /* +0x4 = arg2 */
    void *c;       /* +0x8 = arg3 (value) */
    int   result;  /* +0xc = out, pre-zeroed */
} req_t;

extern void func_0205d560(void *callback, req_t *req);
extern void func_0205d614(void);

int func_0205d5c8(void *arg1, void *arg2, int *arg3) {
    req_t req;

    req.a = arg1;
    req.b = arg2;
    req.c = arg3;
    req.result = 0;
    func_0205d560((void *)func_0205d614, &req);
    if (req.result == 0) {
        *arg3 = 0;
    }
    return 0;
}
