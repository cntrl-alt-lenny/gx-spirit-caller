/* func_ov000_021acebc: zero-fill state + install 2 function pointers.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r1, .L_021acee8            ; r1 = &data_ov000_021c75c4
 *     mov   r0, #0x0
 *     mov   r2, #0x27c
 *     bl    Fill32
 *     ldr   r2, .L_021aceec            ; r2 = &func_ov000_021ad660
 *     ldr   r0, .L_021acef0            ; r0 = &data_ov000_021c758c
 *     ldr   r1, .L_021acef4            ; r1 = &func_ov000_021ad084
 *     str   r2, [r0, #0x1a4]
 *     str   r1, [r0, #0x1a8]
 *     ldmia sp!, {r3, pc}
 */

extern void Fill32(unsigned int value, void *dest, int size_bytes);
extern char data_ov000_021c75c4[];
extern void func_ov000_021ad660(void);
extern void func_ov000_021ad084(void);

typedef struct {
    char _pad_00[0x1a4];
    void (*fn_1a4)(void);          /* +0x1a4 */
    void (*fn_1a8)(void);          /* +0x1a8 */
} state_021c758c_t;

extern state_021c758c_t data_ov000_021c758c;

void func_ov000_021acebc(void) {
    Fill32(0, data_ov000_021c75c4, 0x27c);
    data_ov000_021c758c.fn_1a4 = func_ov000_021ad660;
    data_ov000_021c758c.fn_1a8 = func_ov000_021ad084;
}
