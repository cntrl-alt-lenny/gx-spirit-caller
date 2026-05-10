/* func_0201b6e4: 2-call composition + AND with global field.
 * Returns `func_0201b6c4(arg) & GetSystemWork()->f_8f4`.
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     mov   r5, r0
 *     bl    GetSystemWork
 *     mov   r4, r0
 *     mov   r0, r5
 *     bl    func_0201b6c4
 *     ldr   r1, [r4, #0x8f4]
 *     and   r0, r1, r0
 *     ldmia sp!, {r3, r4, r5, pc}
 */

extern void *GetSystemWork(void);
extern unsigned int func_0201b6c4(int x);

typedef struct {
    char         _pad[0x8f4];
    unsigned int f_8f4;
} systemwork_0201b6e4_t;

unsigned int func_0201b6e4(int x) {
    systemwork_0201b6e4_t *sw = (systemwork_0201b6e4_t *)GetSystemWork();
    unsigned int v = func_0201b6c4(x);
    return sw->f_8f4 & v;
}
