/* func_02005bfc: bit-test arg, conditionally post tasks 0xa4c and store handles.
 *
 *     push {r4, lr}
 *     mov  r4, r0
 *     tst  r4, #0x1
 *     beq  .L_02005c2c
 *     ldr  r0, .L_02005c58       ; r0 = 0xa4c (task id)
 *     mov  r1, #0x4
 *     mov  r2, #0x1
 *     bl   Task_PostLocked
 *     ldr  r1, .L_02005c5c       ; r1 = &data_02103d6c
 *     str  r0, [r1, #0x0]
 *     mov  r0, #0x1
 *     bl   func_02005b74
 *   .L_02005c2c:
 *     tst  r4, #0x2
 *     popeq {r4, pc}
 *     ldr  r0, .L_02005c58
 *     mov  r1, #0x4
 *     mov  r2, #0x1
 *     bl   Task_PostLocked
 *     ldr  r1, .L_02005c5c
 *     str  r0, [r1, #0x4]
 *     mov  r0, #0x2
 *     bl   func_02005b74
 *     pop  {r4, pc}
 */

typedef struct {
    void *f_0;
    void *f_4;
} data_02103d6c_t;

extern data_02103d6c_t data_02103d6c;
extern void *Task_PostLocked(int a, int b, int c);
extern void func_02005b74(int x);

void func_02005bfc(int flags) {
    if (flags & 0x1) {
        data_02103d6c.f_0 = Task_PostLocked(0xa4c, 4, 1);
        func_02005b74(1);
    }
    if (flags & 0x2) {
        data_02103d6c.f_4 = Task_PostLocked(0xa4c, 4, 1);
        func_02005b74(2);
    }
}
