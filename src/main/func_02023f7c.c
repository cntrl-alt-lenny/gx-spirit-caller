/* E-07 stub for brief 198 permuter wave — state setup with task post.
 *
 *     push  {r3, r4, r5, lr}
 *     ldr   r4, =data_0219a8e4
 *     mov   r5, r0
 *     mov   r1, r4; mov r0, #0; mov r2, #8
 *     bl    Fill32
 *     ldr   r0, =data_0219a8e4
 *     str   r5, [r0, #4]
 *     ldr   r0, [r0]
 *     cmp   r0, #0
 *     bne   .L_done
 *     ldr   r1, [r4, #4]
 *     mov   r0, #0x88
 *     mul   r5, r1, r0
 *     mov   r0, r5; mov r1, #4; mov r2, #0
 *     bl    Task_PostLocked
 *     mov   r1, r0; mov r2, r5; mov r0, #0
 *     str   r1, [r4]
 *     bl    Fill32
 *   .L_done:
 *     mov   r0, #1
 *     pop   {r3, r4, r5, pc}
 */

typedef struct {
    void *handle;
    int saved_arg;
} state_t;

extern state_t data_0219a8e4;
extern void Fill32(int value, void *dest, int size);
extern void *Task_PostLocked(int size, int prio, int flags);

int func_02023f7c(int arg0) {
    state_t *p = &data_0219a8e4;
    Fill32(0, p, 8);
    p->saved_arg = arg0;
    if (p->handle == 0) {
        int size = p->saved_arg * 0x88;
        p->handle = Task_PostLocked(size, 4, 0);
        Fill32(0, p->handle, size);
    }
    return 1;
}
