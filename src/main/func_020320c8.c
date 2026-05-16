/* func_020320c8: conditional cleanup + global clear (sp1p5 default).
 *
 *     push  {r3, r4, r5, lr}
 *     movs  r5, r0                ; r5 = arg0, set flags
 *     beq   .L_020320e4
 *     ldr   r4, [r5, #0x14]       ; r4 = arg0->fn
 *     bl    func_02031f40         ; func_02031f40(arg0)
 *     mov   r0, r5
 *     blx   r4                    ; arg0->fn(arg0)
 * .L_020320e4:
 *     ldr   r0, .L_020320f4       ; r0 = &data_0219b2b0
 *     mov   r1, #0x0
 *     str   r1, [r0, #0x0]        ; data_0219b2b0 = 0
 *     pop   {r3, r4, r5, pc}
 * .L_020320f4: .word data_0219b2b0
 */

typedef void (*fn_020320c8_t)(void *p);

typedef struct {
    char            _pad[0x14];
    fn_020320c8_t   fn;          /* +0x14 */
} ctx_020320c8_t;

extern void *data_0219b2b0;
extern void func_02031f40(ctx_020320c8_t *p);

void func_020320c8(ctx_020320c8_t *p) {
    if (p != 0) {
        fn_020320c8_t fn = p->fn;
        func_02031f40(p);
        fn(p);
    }
    data_0219b2b0 = 0;
}
