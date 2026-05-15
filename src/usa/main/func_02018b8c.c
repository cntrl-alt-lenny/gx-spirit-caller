/* func_02018b8c: GetSystemWork + func_020191dc + table offset.
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0
 *     bl    GetSystemWork
 *     mov   r4, r0                ; r4 = system work base
 *     mov   r0, r5
 *     bl    func_020191dc         ; returns 1-based index
 *     sub   r1, r0, #0x1
 *     mov   r0, #0x18
 *     mla   r0, r1, r0, r4        ; r0 = base + (idx-1) * 0x18
 *     pop   {r3, r4, r5, pc}
 */

extern void *GetSystemWork(void);
extern int func_020191dc(int x);

void *func_02018b8c(int x) {
    char *base = (char *)GetSystemWork();
    int idx = func_020191dc(x);
    return base + (idx - 1) * 0x18;
}
