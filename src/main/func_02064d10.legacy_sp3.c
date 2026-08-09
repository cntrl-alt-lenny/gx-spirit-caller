/* func_02064d10: build a small key struct on the stack, wrap a pointer
 * to it, call func_0205442c(p->field_c, &wrapper), then return
 * *result if non-null else 0.
 *
 *   sub sp,#0xa4; str r1,[sp,#4]; strh r2,[sp,#8]   ; key = {r1, r2}
 *   add r3,sp,#4; str r3,[sp]                       ; wrapper = &key
 *   ldr r0,[r0,#0xc]; add r1,sp,#0                  ; args
 *   bl func_0205442c
 *   cmp r0,#0; ldrne r0,[r0]; moveq r0,#0           ; res ? *res : 0
 *
 * C-74: the local block reserves 0xa4 (164) bytes though only ~10 are
 * ever written -- the callee's true reserved span, not just the
 * visibly-touched bytes. Padding a same-scope array forces the frame
 * size without changing what's written.
 */

typedef struct {
    int   field0;   /* +0x0  (r1) */
    short field4;   /* +0x4  (r2, strh) */
    char  _reserved[0xa4 - 0x4 - 0x8]; /* callee's true reserved span (C-74) */
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
    return res ? (int *)*res : 0;
}
