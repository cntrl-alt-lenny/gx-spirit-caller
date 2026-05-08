/* func_0200bce4: allocate (n*0x18)-byte block via Task_PostLocked,
 * zero via Fill32. Same shape as func_0200bca8 with different
 * struct stride.
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     mov   r1, #0x18
 *     mul   r5, r0, r1            ; r5 = n * 0x18
 *     mov   r0, r5
 *     mov   r1, #0x4
 *     mov   r2, #0x0
 *     bl    Task_PostLocked
 *     movs  r4, r0
 *     beq   .L_0200bd18
 *     mov   r1, r4
 *     mov   r2, r5
 *     mov   r0, #0x0
 *     bl    Fill32
 *  .L_0200bd18:
 *     mov   r0, r4
 *     ldmia sp!, {r3, r4, r5, pc}
 */

extern int  Task_PostLocked(void *arg0, int arg1, int arg2);
extern void Fill32(int v, void *dst, int size);

void *func_0200bce4(int n) {
    void *p;
    int size = n * 0x18;
    p = (void *)Task_PostLocked((void *)size, 4, 0);
    if (p) {
        Fill32(0, p, size);
    }
    return p;
}
