/* func_020919ac: scan a global list for the node with flag==1.
 *
 *     ldr r0, _LIT0             ; r0 = &data_021a63d0
 *     ldr r0, [r0, #0x8]           ; r0 = data_021a63d0.first
 *     b .L_10
 * .L_c:
 *     ldr r0, [r0, #0x68]              ; n = n->next
 * .L_10:
 *     cmp r0, #0x0
 *     bxeq lr                              ; return NULL if n==NULL
 *     ldr r1, [r0, #0x64]
 *     cmp r1, #0x1
 *     bne .L_c
 *     bx lr                                    ; return n (flag==1)
 * _LIT0: .word data_021a63d0
 *
 * Leaf, no stack frame -- .legacy.c per C-71.
 *
 * Loop-shape note: both checks (null, flag==1) live in the "check"
 * block reached by the initial jump; only the advance lives in the
 * loop body reached by the backedge -- a plain `while (n != 0) { if
 * (flag==1) return n; advance; }` puts the flag-check in the wrong
 * block (inside the body) and produces a different CFG entirely.
 * Needed explicit goto/labels to land the null-check + flag-check
 * together. Also: the null exit must `return n;`, not `return 0;`
 * -- n is already null there, so returning n avoids materializing a
 * redundant `mov r0,#0` that a literal `return 0;` forces even
 * though bxeq already leaves r0 correct.
 */

struct s_020919ac_node {
    char _pad_00[0x64];
    int flag;
    struct s_020919ac_node *next;
};

struct s_020919ac_head {
    char _pad_00[8];
    struct s_020919ac_node *first;
};

extern struct s_020919ac_head data_021a63d0;

struct s_020919ac_node *func_020919ac(void) {
    struct s_020919ac_node *n = data_021a63d0.first;

    goto check;
body:
    n = n->next;
check:
    if (n == 0) {
        return n;
    }
    if (n->flag == 1) {
        return n;
    }
    goto body;
}
