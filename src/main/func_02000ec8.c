/* func_02000ec8: set field, set flag, call, restore field.
 *
 *     push  {r3, lr}
 *     ldr   r0, .L_02000ef4       ; r0 = &data_021040ac
 *     mov   r1, #0x6
 *     str   r1, [r0, #0xb64]      ; .f_b64 = 6
 *     mov   r1, #0x1
 *     str   r1, [r0, #0x3c]       ; .f_3c = 1
 *     bl    func_02000cc4
 *     ldr   r0, .L_02000ef4
 *     mov   r1, #0x3
 *     str   r1, [r0, #0xb64]      ; .f_b64 = 3
 *     pop   {r3, pc}
 */

typedef struct {
    char _pad0[0x3c];
    int  f_3c;
    char _pad1[0xb24];
    int  f_b64;
} state_021040ac_t;

extern state_021040ac_t data_021040ac;
extern void func_02000cc4(void);

void func_02000ec8(void) {
    data_021040ac.f_b64 = 6;
    data_021040ac.f_3c = 1;
    func_02000cc4();
    data_021040ac.f_b64 = 3;
}
