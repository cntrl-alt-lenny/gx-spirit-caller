; func_0208b32c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208b32c
        .arm
func_0208b32c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x30
    ldr r5, [r0, #0x4]
    ldr r3, [r1, #0xc]
    mov ip, r2
    smull r8, r7, r5, r3
    ldr r6, [r0]
    ldr r3, [r1]
    cmp ip, r1
    smlal r8, r7, r6, r3
    ldr r4, [r0, #0x8]
    ldr r3, [r1, #0x18]
    addeq r2, sp, #0x0
    smlal r8, r7, r4, r3
    mov r3, r8, lsr #0xc
    orr r3, r3, r7, lsl #0x14
    str r3, [r2]
    ldr r3, [r1, #0x10]
    ldr r7, [r1, #0x4]
    smull r9, r8, r5, r3
    smlal r9, r8, r6, r7
    ldr r3, [r1, #0x1c]
    add lr, sp, #0x0
    smlal r9, r8, r4, r3
    mov r3, r9, lsr #0xc
    orr r3, r3, r8, lsl #0x14
    str r3, [r2, #0x4]
    ldr r3, [r1, #0x14]
    ldr r7, [r1, #0x8]
    smull r9, r8, r5, r3
    smlal r9, r8, r6, r7
    ldr r6, [r1, #0x20]
    smlal r9, r8, r4, r6
    mov r4, r9, lsr #0xc
    orr r4, r4, r8, lsl #0x14
    str r4, [r2, #0x8]
    ldr r4, [r0, #0x10]
    ldr r5, [r0, #0xc]
    smull r9, r8, r4, r3
    smlal r9, r8, r5, r7
    ldr r3, [r0, #0x14]
    smlal r9, r8, r3, r6
    mov r6, r9, lsr #0xc
    orr r6, r6, r8, lsl #0x14
    str r6, [r2, #0x14]
    ldr r6, [r1, #0x10]
    ldr r7, [r1, #0x4]
    smull r9, r8, r4, r6
    smlal r9, r8, r5, r7
    ldr r6, [r1, #0x1c]
    smlal r9, r8, r3, r6
    mov r6, r9, lsr #0xc
    orr r6, r6, r8, lsl #0x14
    str r6, [r2, #0x10]
    ldr r7, [r1, #0xc]
    ldr r8, [r1]
    smull sl, r9, r4, r7
    smlal sl, r9, r5, r8
    ldr r6, [r1, #0x18]
    smlal sl, r9, r3, r6
    mov r3, sl, lsr #0xc
    orr r3, r3, r9, lsl #0x14
    str r3, [r2, #0xc]
    ldr r4, [r0, #0x1c]
    ldr r5, [r0, #0x18]
    smull r9, r7, r4, r7
    smlal r9, r7, r5, r8
    ldr r3, [r0, #0x20]
    smlal r9, r7, r3, r6
    mov r6, r9, lsr #0xc
    orr r6, r6, r7, lsl #0x14
    str r6, [r2, #0x18]
    ldr r6, [r1, #0x10]
    ldr r7, [r1, #0x4]
    smull r9, r6, r4, r6
    smlal r9, r6, r5, r7
    ldr r8, [r1, #0x1c]
    smlal r9, r6, r3, r8
    mov r7, r9, lsr #0xc
    orr r7, r7, r6, lsl #0x14
    str r7, [r2, #0x1c]
    ldr r7, [r1, #0x14]
    ldr r6, [r1, #0x8]
    smull r9, r8, r4, r7
    smlal r9, r8, r5, r6
    ldr r5, [r1, #0x20]
    smlal r9, r8, r3, r5
    mov r3, r9, lsr #0xc
    orr r3, r3, r8, lsl #0x14
    str r3, [r2, #0x20]
    ldr r4, [r0, #0x28]
    ldr r3, [r0, #0x24]
    smull r8, r7, r4, r7
    smlal r8, r7, r3, r6
    ldr r0, [r0, #0x2c]
    ldr r6, [r1, #0x2c]
    smlal r8, r7, r0, r5
    mov r5, r8, lsr #0xc
    orr r5, r5, r7, lsl #0x14
    adds r5, r6, r5
    str r5, [r2, #0x2c]
    ldr r5, [r1, #0x10]
    ldr r6, [r1, #0x4]
    smull r8, r5, r4, r5
    smlal r8, r5, r3, r6
    ldr r7, [r1, #0x1c]
    ldr r9, [r1, #0x28]
    smlal r8, r5, r0, r7
    mov r6, r8, lsr #0xc
    orr r6, r6, r5, lsl #0x14
    adds r5, r9, r6
    str r5, [r2, #0x28]
    ldr r8, [r1, #0x24]
    ldr r6, [r1, #0x18]
    ldr r5, [r1]
    ldr r1, [r1, #0xc]
    smull r7, r1, r4, r1
    smlal r7, r1, r3, r5
    smlal r7, r1, r0, r6
    mov r0, r7, lsr #0xc
    orr r0, r0, r1, lsl #0x14
    adds r0, r8, r0
    cmp r2, lr
    str r0, [r2, #0x24]
    addne sp, sp, #0x30
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bxne lr
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr, {r0, r1, r2, r3}
    stmia ip, {r0, r1, r2, r3}
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
