/* func_02034784: C-42 — 3-way switch on helper return.
 *
 *   push {r3, lr}
 *   bl func_02032634
 *   cmp r0, #1; beq L1
 *   cmp r0, #2; beq L2
 *   b L3
 *   L1: mov r0, #1; pop
 *   L2: mov r0, #2; pop
 *   L3: mov r0, #0; pop
 *
 * Note: switch+case+default form forces the branch-based shape; an
 * if-else chain would collapse to conditional execution.
 */

extern int func_02032634(void);

int func_02034784(void) {
    switch (func_02032634()) {
        case 1: return 1;
        case 2: return 2;
        default: return 0;
    }
}
