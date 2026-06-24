; func_0208b0f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208b0f8
        .arm
func_0208b0f8:
    stmdb sp!, {r4, lr}
    ldr r4, [r0]
    ldr ip, [sp, #0x8]
    smull lr, r4, r2, r4
    mov lr, lr, lsr #0xc
    orr lr, lr, r4, lsl #0x14
    str lr, [r1]
    ldr r4, [r0, #0x4]
    smull lr, r4, r2, r4
    mov lr, lr, lsr #0xc
    orr lr, lr, r4, lsl #0x14
    str lr, [r1, #0x4]
    ldr lr, [r0, #0x8]
    smull r4, lr, r2, lr
    mov r2, r4, lsr #0xc
    orr r2, r2, lr, lsl #0x14
    str r2, [r1, #0x8]
    ldr r2, [r0, #0xc]
    smull lr, r2, r3, r2
    mov lr, lr, lsr #0xc
    orr lr, lr, r2, lsl #0x14
    str lr, [r1, #0xc]
    ldr r2, [r0, #0x10]
    smull lr, r2, r3, r2
    mov lr, lr, lsr #0xc
    orr lr, lr, r2, lsl #0x14
    str lr, [r1, #0x10]
    ldr r2, [r0, #0x14]
    smull lr, r2, r3, r2
    mov r3, lr, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r1, #0x14]
    ldr r2, [r0, #0x18]
    smull r3, r2, ip, r2
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r1, #0x18]
    ldr r2, [r0, #0x1c]
    smull r3, r2, ip, r2
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r1, #0x1c]
    ldr r0, [r0, #0x20]
    smull r2, r0, ip, r0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    str r2, [r1, #0x20]
    ldmia sp!, {r4, lr}
    bx lr
