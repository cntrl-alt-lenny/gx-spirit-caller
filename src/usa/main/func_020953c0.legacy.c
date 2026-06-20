/* func_020953c0: 2-call subtract chain. Computes
 * (0x100 - func_02095420()) - func_020953e0(). Style A.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    func_02095420
 *     mov   r4, r0
 *     bl    func_020953e0
 *     rsb   r1, r4, #0x100
 *     sub   r0, r1, r0
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 */

extern int func_02095420(void);
extern int func_020953e0(void);

int func_020953c0(void) {
    int a = func_02095420();
    int b = func_020953e0();
    return (0x100 - a) - b;
}
