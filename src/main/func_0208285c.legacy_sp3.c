/* func_0208285c: linked-list walk + bit-test callback (C-24 family).
 *
 *     push  {r4, r5, r6, r7, lr}
 *     sub   sp, sp, #0x4
 *     mov   r6, r0                  ; r6 = arg
 *     mov   r5, r1                  ; r5 = list (running ptr)
 *     mov   r0, #0x0                ; result = 0
 *     lsl   r4, r2, #0x1            ; r4 = idx*2
 *     mov   r7, #0x1
 * .L_02082878:
 *     add   r1, r4, r5              ; r1 = list + idx*2
 *     ldrh  r2, [r1, #0x1a]         ; f = list->flags[idx]
 *     ands  r1, r2, #0x100
 *     beq   .L_020828a0
 *     ldr   r3, [r5, #0xc]          ; fn = list->fn
 *     mov   r0, r6
 *     mov   r1, r5
 *     and   r2, r2, #0xff
 *     blx   r3                       ; fn(arg, list, f & 0xff)
 *     mov   r0, r7                   ; result = 1
 * .L_020828a0:
 *     ldr   r5, [r5, #0x10]          ; list = list->next
 *     cmp   r5, #0x0
 *     bne   .L_02082878
 *     add   sp, sp, #0x4
 *     pop   {r4, r5, r6, r7, pc}
 */

typedef int (*fn_0208285c_t)(void *arg, void *node, int byte);

typedef struct node_0208285c {
    char                       _pad0[0xc];
    fn_0208285c_t              fn;          /* +0xc */
    struct node_0208285c      *next;        /* +0x10 */
    char                       _pad1[0x6];  /* 0x14..0x19 */
    unsigned short             flags[1];    /* +0x1a — open-array via idx */
} node_0208285c_t;

int func_0208285c(void *arg, node_0208285c_t *list, int idx) {
    int result = 0;
    do {
        unsigned short f = list->flags[idx];
        if (f & 0x100) {
            list->fn(arg, list, f & 0xff);
            result = 1;
        }
        list = list->next;
    } while (list != 0);
    return result;
}
