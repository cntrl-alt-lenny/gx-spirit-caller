; func_0208b898 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208b898
        .arm
func_0208b898:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x44
    ldr r5, [r0, #0x4]
    ldr r3, [r1, #0x10]
    mov ip, r2
    smull r6, r4, r5, r3
    ldr r9, [r0]
    ldr r3, [r1]
    cmp ip, r1
    smlal r6, r4, r9, r3
    ldr sl, [r0, #0x8]
    ldr r3, [r1, #0x20]
    ldr r8, [r0, #0xc]
    smlal r6, r4, sl, r3
    ldr r3, [r1, #0x30]
    addeq r2, sp, #0x0
    smlal r6, r4, r8, r3
    mov r3, r6, lsr #0xc
    orr r3, r3, r4, lsl #0x14
    str r3, [r2]
    ldr r3, [r1, #0x14]
    ldr r4, [r1, #0x4]
    smull r7, r6, r5, r3
    smlal r7, r6, r9, r4
    ldr r3, [r1, #0x24]
    ldr r4, [r1, #0x34]
    smlal r7, r6, sl, r3
    smlal r7, r6, r8, r4
    mov r3, r7, lsr #0xc
    orr r3, r3, r6, lsl #0x14
    str r3, [r2, #0x4]
    ldr r3, [r1, #0x1c]
    ldr r4, [r1, #0xc]
    smull r7, r6, r5, r3
    smlal r7, r6, r9, r4
    ldr r3, [r1, #0x2c]
    ldr r4, [r1, #0x3c]
    smlal r7, r6, sl, r3
    smlal r7, r6, r8, r4
    mov r3, r7, lsr #0xc
    orr r3, r3, r6, lsl #0x14
    str r3, [r2, #0xc]
    ldr r6, [r1, #0x18]
    ldr r7, [r1, #0x8]
    smull r4, r3, r5, r6
    smlal r4, r3, r9, r7
    ldr r9, [r1, #0x28]
    ldr r5, [r1, #0x38]
    smlal r4, r3, sl, r9
    smlal r4, r3, r8, r5
    mov r4, r4, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    str r4, [r2, #0x8]
    ldr r8, [r0, #0x14]
    ldr sl, [r0, #0x10]
    smull r4, r3, r8, r6
    smlal r4, r3, sl, r7
    ldr r7, [r0, #0x18]
    ldr r6, [r0, #0x1c]
    smlal r4, r3, r7, r9
    smlal r4, r3, r6, r5
    mov r4, r4, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    str r4, [r2, #0x18]
    ldr r3, [r1, #0x14]
    ldr r4, [r1, #0x4]
    smull fp, r3, r8, r3
    smlal fp, r3, sl, r4
    ldr r5, [r1, #0x24]
    ldr r9, [r1, #0x34]
    smlal fp, r3, r7, r5
    smlal fp, r3, r6, r9
    mov r4, fp, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    str r4, [r2, #0x14]
    ldr r3, [r1, #0x1c]
    ldr r4, [r1, #0xc]
    smull fp, r3, r8, r3
    smlal fp, r3, sl, r4
    ldr r5, [r1, #0x2c]
    ldr r9, [r1, #0x3c]
    smlal fp, r3, r7, r5
    smlal fp, r3, r6, r9
    mov r4, fp, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    str r4, [r2, #0x1c]
    ldr r9, [r1, #0x10]
    ldr fp, [r1]
    smull r4, r3, r8, r9
    smlal r4, r3, sl, fp
    ldr r5, [r1, #0x20]
    ldr r8, [r1, #0x30]
    smlal r4, r3, r7, r5
    smlal r4, r3, r6, r8
    mov r4, r4, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    str r4, [r2, #0x10]
    ldr r6, [r0, #0x24]
    ldr r7, [r0, #0x20]
    smull r4, r3, r6, r9
    smlal r4, r3, r7, fp
    ldr sl, [r0, #0x28]
    add lr, sp, #0x0
    smlal r4, r3, sl, r5
    ldr r5, [r0, #0x2c]
    cmp r2, lr
    smlal r4, r3, r5, r8
    mov r4, r4, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    str r4, [r2, #0x20]
    ldr r3, [r1, #0x14]
    ldr r4, [r1, #0x4]
    smull fp, r3, r6, r3
    smlal fp, r3, r7, r4
    ldr r8, [r1, #0x24]
    ldr r9, [r1, #0x34]
    smlal fp, r3, sl, r8
    smlal fp, r3, r5, r9
    mov r4, fp, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    str r4, [r2, #0x24]
    ldr r3, [r1, #0x1c]
    ldr r4, [r1, #0xc]
    smull fp, r3, r6, r3
    smlal fp, r3, r7, r4
    ldr r8, [r1, #0x2c]
    ldr r9, [r1, #0x3c]
    smlal fp, r3, sl, r8
    smlal fp, r3, r5, r9
    mov r4, fp, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    str r4, [r2, #0x2c]
    ldr r9, [r1, #0x18]
    ldr r8, [r1, #0x8]
    smull r4, r3, r6, r9
    smlal r4, r3, r7, r8
    ldr r7, [r1, #0x28]
    ldr r6, [r1, #0x38]
    smlal r4, r3, sl, r7
    smlal r4, r3, r5, r6
    mov r4, r4, lsr #0xc
    orr r4, r4, r3, lsl #0x14
    str r4, [r2, #0x28]
    ldr r5, [r0, #0x34]
    ldr r4, [r0, #0x30]
    smull sl, r9, r5, r9
    ldr r3, [r0, #0x38]
    smlal sl, r9, r4, r8
    smlal sl, r9, r3, r7
    ldr r0, [r0, #0x3c]
    addne sp, sp, #0x44
    smlal sl, r9, r0, r6
    mov r6, sl, lsr #0xc
    orr r6, r6, r9, lsl #0x14
    str r6, [r2, #0x38]
    ldr r6, [r1, #0x14]
    ldr r7, [r1, #0x4]
    smull sl, r6, r5, r6
    smlal sl, r6, r4, r7
    ldr r8, [r1, #0x24]
    ldr r9, [r1, #0x34]
    smlal sl, r6, r3, r8
    smlal sl, r6, r0, r9
    mov r7, sl, lsr #0xc
    orr r7, r7, r6, lsl #0x14
    str r7, [r2, #0x34]
    ldr r6, [r1, #0x10]
    ldr r7, [r1]
    smull sl, r6, r5, r6
    smlal sl, r6, r4, r7
    ldr r8, [r1, #0x20]
    ldr r9, [r1, #0x30]
    smlal sl, r6, r3, r8
    smlal sl, r6, r0, r9
    mov r7, sl, lsr #0xc
    orr r7, r7, r6, lsl #0x14
    str r7, [r2, #0x30]
    ldr r8, [r1, #0x3c]
    ldr r7, [r1, #0x2c]
    ldr r6, [r1, #0xc]
    ldr r1, [r1, #0x1c]
    smull r9, r1, r5, r1
    smlal r9, r1, r4, r6
    smlal r9, r1, r3, r7
    smlal r9, r1, r0, r8
    mov r0, r9, lsr #0xc
    orr r0, r0, r1, lsl #0x14
    str r0, [r2, #0x3c]
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxne lr
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr, {r0, r1, r2, r3}
    stmia ip, {r0, r1, r2, r3}
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
