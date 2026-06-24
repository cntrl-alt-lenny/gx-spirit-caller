; func_0208bbbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020945a4
        .global func_0208bbbc
        .arm
func_0208bbbc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    cmp r7, r6
    beq .L_348
    bl func_020945a4
.L_348:
    ldr r0, [r7, #0x10]
    ldr r1, [r7]
    smull r3, r2, r4, r0
    smlal r3, r2, r5, r1
    ldr r0, [sp, #0x18]
    ldr r1, [r7, #0x20]
    ldr ip, [r7, #0x30]
    smlal r3, r2, r0, r1
    mov r1, r3, lsr #0xc
    orr r1, r1, r2, lsl #0x14
    add r1, ip, r1
    str r1, [r6, #0x30]
    ldr r1, [r7, #0x14]
    ldr r2, [r7, #0x4]
    smull ip, r3, r4, r1
    smlal ip, r3, r5, r2
    ldr r1, [r7, #0x24]
    ldr r2, [r7, #0x34]
    smlal ip, r3, r0, r1
    mov r1, ip, lsr #0xc
    orr r1, r1, r3, lsl #0x14
    add r1, r2, r1
    str r1, [r6, #0x34]
    ldr r1, [r7, #0x18]
    ldr r2, [r7, #0x8]
    smull ip, r3, r4, r1
    smlal ip, r3, r5, r2
    ldr r1, [r7, #0x28]
    ldr r2, [r7, #0x38]
    smlal ip, r3, r0, r1
    mov r1, ip, lsr #0xc
    orr r1, r1, r3, lsl #0x14
    add r1, r2, r1
    str r1, [r6, #0x38]
    ldr r1, [r7, #0x1c]
    ldr r2, [r7, #0xc]
    smull ip, r3, r4, r1
    smlal ip, r3, r5, r2
    ldr r1, [r7, #0x2c]
    ldr r2, [r7, #0x3c]
    smlal ip, r3, r0, r1
    mov r0, ip, lsr #0xc
    orr r0, r0, r3, lsl #0x14
    add r0, r2, r0
    str r0, [r6, #0x3c]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
