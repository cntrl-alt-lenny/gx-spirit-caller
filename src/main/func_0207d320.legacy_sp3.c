/* func_0207d320: linked-list walk + per-node callback (C-24 family).
 *
 *     push  {r4, r5, r6, r7, lr}
 *     sub   sp, sp, #0x4
 *     mov   r7, r0
 *     ldr   r0, [r7, #0x2c]      ; n = head->first
 *     mov   r6, r1
 *     cmp   r0, #0x0
 *     mov   r5, r2
 *     addeq sp, sp, #0x4
 *     popeq {r4, r5, r6, r7, pc}
 * .L_0207d344:
 *     ldr   r4, [r0, #0xc]       ; next = n->next  (save first!)
 *     mov   r1, r7
 *     mov   r2, r5
 *     add   r0, r0, #0x10        ; r0 = &n->data
 *     blx   r6                   ; fn(&n->data, head, arg)
 *     mov   r0, r4               ; n = next
 *     cmp   r4, #0x0
 *     bne   .L_0207d344
 *     add   sp, sp, #0x4
 *     pop   {r4, r5, r6, r7, pc}
 */

typedef void (*fn_0207d320_t)(void *data, void *head, void *arg);

typedef struct node_0207d320 {
    char                    _pad[0xc];
    struct node_0207d320   *next;       /* +0xc */
} node_0207d320_t;

typedef struct {
    char               _pad[0x2c];
    node_0207d320_t   *first;           /* +0x2c */
} head_0207d320_t;

void func_0207d320(head_0207d320_t *head, fn_0207d320_t fn, void *arg) {
    node_0207d320_t *n = head->first;
    if (n == 0) return;
    do {
        node_0207d320_t *next = n->next;
        fn((char *)n + 0x10, head, arg);
        n = next;
    } while (n != 0);
}
