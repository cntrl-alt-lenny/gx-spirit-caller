/* func_0206e504: find a node in a linked list, return &(the link to it).
 *
 *     ldr r2, [r0]
 *     cmp r2, #0x0
 *     beq .L_24
 * .L_c:
 *     cmp r2, r1
 *     bxeq lr
 *     add r0, r2, #0x7c
 *     ldr r2, [r2, #0x7c]
 *     cmp r2, #0x0
 *     bne .L_c
 * .L_24:
 *     mov r0, #0x0
 *     bx lr
 *
 * Leaf, no stack frame -- .legacy.c per C-71. r0 doubles as both the
 * "address of the link that points to the current node" (self on
 * the first check, since the head link IS self+0) and the eventual
 * return value; two distinct "not found" exits share one tail block.
 *
 * C-55-family: the pre-loop `if (cur == 0) return 0;` needs `goto`
 * to a shared `notfound:` label (matching orig's real `beq` branch)
 * -- a plain `return 0;` there gets if-converted into a predicated
 * moveq/bxeq pair instead, one word longer and structurally wrong,
 * even though the SAME check inside the loop is fine either way.
 */

struct s_0206e504_node {
    char _pad_00[0x7c];
    struct s_0206e504_node *next;
};

void *func_0206e504(struct s_0206e504_node **self, struct s_0206e504_node *target) {
    struct s_0206e504_node *cur = *self;
    void *link = self;

    if (cur == 0) {
        goto notfound;
    }
    while (1) {
        if (cur == target) {
            return link;
        }
        link = &cur->next;
        cur = cur->next;
        if (cur == 0) {
            goto notfound;
        }
    }

notfound:
    return 0;
}
