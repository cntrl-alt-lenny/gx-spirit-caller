/* func_020a34e8: pair-into-stack-then-dispatch (sp2p3 .legacy.c).
 *
 *     push  {lr}
 *     sub   sp, sp, #0x4
 *     cmp   r1, #0x2
 *     addeq sp, sp, #0x4
 *     popeq {lr}
 *     bxeq  lr                    ; if b==2 return
 *     cmp   r1, #0x0
 *     addeq sp, sp, #0x4
 *     popeq {lr}
 *     bxeq  lr                    ; if b==0 return
 *     ldr   r2, .L_020a3630
 *     strh  r0, [sp, #0x0]        ; pair[0] = a
 *     ldr   r0, [r2, #0x0]        ; r0 = data_021a9818 (the ptr value)
 *     strh  r1, [sp, #0x2]        ; pair[1] = b
 *     ldr   r2, [r0, #0x51c]      ; r2 = obj->fn
 *     add   r1, sp, #0x0          ; r1 = &pair
 *     mov   r0, #0xff
 *     blx   r2                    ; fn(0xff, &pair)
 *     add   sp, sp, #0x4
 *     pop   {lr}
 *     bx    lr
 * .L_020a3630: .word data_021a9818
 */

typedef void (*fn_020a35dc_t)(int x, unsigned short *pair);

typedef struct {
    char            _pad[0x51c];
    fn_020a35dc_t   fn;          /* +0x51c */
} obj_020a35dc_t;

extern obj_020a35dc_t *data_021a9818;

void func_020a34e8(unsigned short a, unsigned short b) {
    unsigned short pair[2];
    if (b == 2) return;
    if (b == 0) return;
    pair[0] = a;
    pair[1] = b;
    data_021a9818->fn(0xff, pair);
}
