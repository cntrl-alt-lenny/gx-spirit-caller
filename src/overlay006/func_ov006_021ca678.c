/* func_ov006_021ca678: acquire a handle, populate a 0x28-byte stack event
 * block (patching its field_0x14 sub-field), fire it, then invoke the task.
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     sub   sp, sp, #0x28
 *     mov   r5, r0
 *     ldr   r0, .L_LIT0          ; data_ov006_021cf094
 *     mov   r1, #0x4
 *     mov   r2, #0x0
 *     bl    func_02006c0c
 *     ...
 *     ldmia sp!, {r3, r4, r5, pc}
 */

extern void *func_02006c0c(void *a, int b, int c);
extern void func_0201d47c(void *buf);
extern void func_0201e5b8(void *buf);
extern void Task_Invoke(void *handle);
extern char data_ov006_021cf094[];

int func_ov006_021ca678(char *self) {
    char buf[0x28];
    void *h;
    unsigned short v;

    h = func_02006c0c(data_ov006_021cf094, 4, 0);
    func_0201d47c(buf);

    *(void **)(buf + 0) = h;
    v = (*(unsigned short *)(buf + 0x14) & ~0xf) | 6;
    *(int *)(buf + 8) = -1;
    *(unsigned short *)(buf + 0x14) = v;
    *(int *)(buf + 0xc) = *(int *)(self + 0x38) << 5;
    *(short *)(buf + 0x10) = *(int *)(self + 0x3c) << 5;

    func_0201e5b8(buf);
    Task_Invoke(h);

    return 1;
}
