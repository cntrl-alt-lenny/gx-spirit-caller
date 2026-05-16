/* func_0206e940: free-style callback with allocation header (sp2p3 routing).
 *
 *     push  {lr}
 *     sub   sp, sp, #0x4
 *     cmp   r0, #0x0
 *     addeq sp, sp, #0x4
 *     popeq {lr}
 *     bxeq  lr
 *     ldr   r1, .L_0206e97c       ; r1 = &data_0219ed54 (the fn ptr global)
 *     ldr   r2, [r0, #-0x4]       ; r2 = header word (just before p)
 *     ldr   r3, [r1, #0x0]        ; r3 = data_0219ed54 (the fn)
 *     sub   r1, r0, #0x4          ; r1 = &header
 *     mov   r0, #0x0
 *     blx   r3                    ; fn(0, &header, header)
 *     add   sp, sp, #0x4
 *     pop   {lr}
 *     bx    lr
 * .L_0206e97c: .word data_0219ed54
 */

typedef void (*fn_0206e940_t)(int x, int *header_ptr, int header_val);

extern fn_0206e940_t data_0219ed54;

void func_0206e940(void *p) {
    int *hdr;
    if (p == 0) return;
    hdr = (int *)p - 1;
    data_0219ed54(0, hdr, *hdr);
}
