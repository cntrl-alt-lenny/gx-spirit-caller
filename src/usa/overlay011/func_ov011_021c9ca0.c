/* func_ov011_021c9ca0: family 155423ea sibling of 021c9d60 — same
 * shape, helper func_ov000_021af334.
 *
 *     push  {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r0, [r0, #0x900]
 *     lsl   r0, r0, #0x13
 *     lsrs  r0, r0, #0x1f
 *     popne {r3, pc}
 *     bl    func_ov000_021af334
 *     pop   {r3, pc}
 */

extern unsigned int *GetSystemWork(void);
extern void func_ov000_021af334(void);

void func_ov011_021c9ca0(void) {
    if ((GetSystemWork()[0x240] << 19) >> 31) return;
    func_ov000_021af334();
}
