/* func_020b4284: call every function pointer in a NULL-terminated table.
 *
 *     stmdb sp!, {r4, lr}
 *     ldr r4, _LIT0             ; r4 = &ARM9_CTOR_START
 *     b .L_14
 * .L_c:
 *     blx r0
 *     add r4, r4, #0x4
 * .L_14:
 *     cmp r4, #0x0
 *     ldrne r0, [r4]
 *     cmpne r0, #0x0
 *     bne .L_c
 *     ldmia sp!, {r4, pc}
 * _LIT0: .word ARM9_CTOR_START
 *
 * push{r4,lr} (even count, no r3-spill) / fused pop{r4,pc} -> plain
 * tier, not .legacy.c. Classic static-constructor-table walker.
 */

typedef void (*ctor_fn)(void);
extern ctor_fn ARM9_CTOR_START[];

void func_020b4284(void) {
    ctor_fn *p = ARM9_CTOR_START;

    while (p != 0 && *p != 0) {
        (*p)();
        p++;
    }
}
