/* func_0206e90c: alloc-via-global-fn + store-with-postincrement (sp2p3).
 *
 *     push  {r4, lr}
 *     ldr   r1, .L_0206e9ac       ; r1 = &data_0219ec78
 *     add   r4, r0, #0x4          ; r4 = p + 4
 *     ldr   r2, [r1, #0x0]        ; r2 = data_0219ec78 (fn)
 *     mov   r1, r4
 *     mov   r0, #0x0
 *     blx   r2                    ; r = fn(0, p+4)
 *     cmp   r0, #0x0
 *     strne r4, [r0], #0x4        ; if (r) *r++ = p+4
 *     pop   {r4, lr}
 *     bx    lr
 * .L_0206e9ac: .word data_0219ec78
 */

typedef void **(*fn_0206e980_t)(int, void *);

extern fn_0206e980_t data_0219ec78;

void **func_0206e90c(void *p) {
    void *p4 = (char *)p + 4;
    void **r = data_0219ec78(0, p4);
    if (r != 0) *r++ = p4;
    return r;
}
