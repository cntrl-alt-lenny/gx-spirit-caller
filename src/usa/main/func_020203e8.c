/* func_020203e8: IRQ-bracketed global setter at data_02191e60[0x38].
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    OS_DisableIrq
 *     ldr   r1, .L_02020458            ; r1 = &data_02191e60
 *     str   r4, [r1, #0x38]
 *     bl    OS_RestoreIrq               ; r0 still has saved (keep-in-r0)
 *     ldmia sp!, {r4, pc}
 *   .L_02020458: .word data_02191e60
 *
 * Uses struct typedef to pin base+offset addressing and defeat mwcc's
 * pool-fold heuristic (the #158/#170 offset-fold pattern).
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

typedef struct {
    char _pad_00[0x38];
    int  slot;
} data_02191f40_t;

extern data_02191f40_t data_02191e60;

void func_020203e8(int value) {
    int saved = OS_DisableIrq();
    data_02191e60.slot = value;
    OS_RestoreIrq(saved);
}
