/* func_ov011_021c9c80: family 155423ea — if bit 12 of GetSystemWork's
 * 0x900 word is set, do nothing; otherwise call the helper.
 *
 *     push  {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r0, [r0, #0x900]
 *     lsl   r0, r0, #0x13        ; << 19
 *     lsrs  r0, r0, #0x1f        ; >> 31  -> bit 12, set flags
 *     popne {r3, pc}             ; if set, return
 *     bl    func_ov000_021af304
 *     pop   {r3, pc}
 */

extern unsigned int *GetSystemWork(void);
extern void func_ov000_021af304(void);

void func_ov011_021c9c80(void) {
    if ((GetSystemWork()[0x240] << 19) >> 31) return;
    func_ov000_021af304();
}
