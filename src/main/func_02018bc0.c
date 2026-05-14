/* func_02018bc0: GetSystemWork + func_02019210 + table offset.
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0
 *     bl    GetSystemWork
 *     mov   r4, r0                ; r4 = system work base
 *     mov   r0, r5
 *     bl    func_02019210         ; returns 1-based index
 *     sub   r1, r0, #0x1
 *     mov   r0, #0x18
 *     mla   r0, r1, r0, r4        ; r0 = base + (idx-1) * 0x18
 *     pop   {r3, r4, r5, pc}
 */

extern void *GetSystemWork(void);
extern int func_02019210(int x);

void *func_02018bc0(int x) {
    char *base = (char *)GetSystemWork();
    int idx = func_02019210(x);
    return base + (idx - 1) * 0x18;
}
