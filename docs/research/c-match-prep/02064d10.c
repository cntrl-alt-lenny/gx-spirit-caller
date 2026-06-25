/* CAMPAIGN-PREP candidate for func_02064d10 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-struct fill (store-order) + null-guard deref
 *   risk:       0xa4 frame may differ; key struct layout/padding guessed; wrapper-indirection may need extra slot ordering
 *   confidence: low
 */
/* func_02064d10: build a small key struct on the stack, wrap a pointer
 * to it, call func_0205442c(p->field_c, &wrapper), then return
 * *result if non-null else 0.
 *
 *   sub sp,#0xa4; str r1,[sp,#4]; strh r2,[sp,#8]   ; key = {r1, r2}
 *   add r3,sp,#4; str r3,[sp]                       ; wrapper = &key
 *   ldr r0,[r0,#0xc]; add r1,sp,#0                  ; args
 *   bl func_0205442c
 *   cmp r0,#0; ldrne r0,[r0]; moveq r0,#0           ; res ? *res : 0
 */

typedef struct {
    int            field0;   /* +0x0  (r1) */
    short          field4;   /* +0x4  (r2, strh) */
} Key;

extern int *func_0205442c(void *ctx, Key **wrapper);

int *func_02064d10(void *p, int a, short b) {
    Key key;
    Key *wrapper;
    int *res;

    key.field0 = a;
    key.field4 = b;
    wrapper = &key;
    res = func_0205442c(((void **)p)[3], &wrapper);
    if (res == 0) return 0;
    return (int *)*res;
}
