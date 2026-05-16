/* func_02033000: alloc + register + dispatch (C-24 family).
 *
 *     push  {r4, r5, r6, lr}
 *     mov   r2, r0                  ; r2 = alloc_fn
 *     mov   r6, r1                  ; r6 = finish_fn
 *     mov   r0, #0x700
 *     mov   r1, #0x20
 *     blx   r2                      ; p = alloc_fn(0x700, 0x20)
 *     movs  r5, r0
 *     mvneq r0, #0x0                ; if p==0 → r0 = -1
 *     popeq {r4, r5, r6, pc}
 *     bl    func_02052b60           ; x = func_02052b60()
 *     mov   r4, r0
 *     ldr   r1, .L_02033098
 *     mov   r0, r5
 *     str   r4, [r1, #0x0]          ; data_020fe388 = x
 *     blx   r6                      ; finish_fn(p)
 *     mov   r0, r4
 *     pop   {r4, r5, r6, pc}
 * .L_02033098: .word data_020fe388
 */

typedef void *(*alloc_02033054_t)(int size, int align);
typedef void (*finish_02033054_t)(void *p);

extern int func_02052b60(void);
extern int data_020fe388;

int func_02033000(alloc_02033054_t alloc, finish_02033054_t finish) {
    void *p = alloc(0x700, 0x20);
    int x;
    if (p == 0) return -1;
    x = func_02052b60();
    data_020fe388 = x;
    finish(p);
    return x;
}
