/* func_020a333c: linked-list tail insertion. "next-ahead" loop form
 * (keep `next` one step ahead of `cur`) makes mwcc emit the orig's
 * `mov cur,next; ldr next,[next,#offset]; cmp; bne` walk.
 *
 *     ldr   r1, .L_020a337c           ; data_021a9850
 *     ldr   r2, [r1, #0x0]
 *     cmp   r2, #0x0
 *     streq r0, [r1, #0x0]
 *     beq   .L_020a3370
 *     ldr   r1, [r2, #0x4bc]
 *     cmp   r1, #0x0
 *     beq   .L_020a336c
 *  .L_020a335c:
 *     mov   r2, r1
 *     ldr   r1, [r1, #0x4bc]
 *     cmp   r1, #0x0
 *     bne   .L_020a335c
 *  .L_020a336c:
 *     str   r0, [r2, #0x4bc]
 *  .L_020a3370:
 *     mov   r1, #0x0
 *     str   r1, [r0, #0x4bc]
 *     bx    lr
 */

typedef struct node_020a333c {
    char                  _pad[0x4bc];
    struct node_020a333c *next;
} node_020a333c_t;

extern node_020a333c_t *data_021a9850;

void func_020a333c(node_020a333c_t *node) {
    node_020a333c_t *cur = data_021a9850;
    if (cur == 0) {
        data_021a9850 = node;
    } else {
        node_020a333c_t *next = cur->next;
        while (next != 0) {
            cur = next;
            next = next->next;
        }
        cur->next = node;
    }
    node->next = 0;
}
