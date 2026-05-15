/* func_02032074: lazy-alloc + register-into-global + dispatch (C-24 family).
 *
 *     push  {r4, r5, r6, lr}
 *     movs  r6, r0
 *     mov   r5, r1
 *     mov   r4, r2
 *     bne   .L_020320a8           ; arg0 != 0 → skip alloc
 *     mov   r0, #0x18
 *     mov   r1, #0x4
 *     blx   r5                    ; alloc(0x18, 4)
 *     movs  r6, r0
 *     popeq {r4, r5, r6, pc}      ; if alloc returned 0 → return
 *     mov   r1, #0x0
 *     mov   r2, #0x18
 *     bl    func_020945f4         ; func_020945f4(p, 0, 0x18)
 * .L_020320a8:
 *     ldr   r3, .L_020320c4
 *     mov   r0, r6
 *     mov   r1, r5
 *     mov   r2, r4
 *     str   r6, [r3, #0x0]        ; data_0219b2b0 = p
 *     bl    func_02031ff0         ; func_02031ff0(p, alloc, q)
 *     pop   {r4, r5, r6, pc}
 * .L_020320c4: .word data_0219b2b0
 */

typedef void *(*alloc_02032074_t)(int size, int align);

extern void *data_0219b2b0;
extern void func_020945f4(void *p, int b, int c);
extern void func_02031ff0(void *p, alloc_02032074_t alloc, void *q);

void func_02032074(void *p, alloc_02032074_t alloc, void *q) {
    if (p == 0) {
        p = alloc(0x18, 4);
        if (p == 0) return;
        func_020945f4(p, 0, 0x18);
    }
    data_0219b2b0 = p;
    func_02031ff0(p, alloc, q);
}
