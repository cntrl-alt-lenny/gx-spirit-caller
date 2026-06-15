; func_02085abc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02085abc
        .arm
func_02085abc:
    stmdb sp!, {r4, lr}
    ldr r3, [r1, #0x18]
    mov r2, #0x0
    str r3, [r0]
    ldr r3, [r1, #0x1c]
    str r3, [r0, #0x14]
    str r2, [r0, #0x4]
    ldr r4, [r1, #0x18]
    ldr r3, [r1, #0x24]
    ldrh lr, [r1, #0x2c]
    smull ip, r3, r4, r3
    mov r4, ip, lsr #0x8
    orr r4, r4, r3, lsl #0x18
    rsb r3, r4, #0x0
    mul r3, lr, r3
    str r3, [r0, #0x30]
    ldr r4, [r1, #0x1c]
    ldr ip, [r1, #0x28]
    mov r3, r4, lsl #0x1
    smull lr, ip, r4, ip
    rsb r4, r3, #0x0
    mov r3, lr, lsr #0x8
    ldrh lr, [r1, #0x2e]
    add r1, r4, #0x2000
    orr r3, r3, ip, lsl #0x18
    mul r4, lr, r1
    mul r1, lr, r3
    add r1, r1, r4, lsl #0x3
    str r1, [r0, #0x34]
    str r2, [r0, #0x10]
    ldmia sp!, {r4, pc}
