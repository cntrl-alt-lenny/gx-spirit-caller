; func_02086ea0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02086ea0
        .arm
func_02086ea0:
    stmdb sp!, {r4, lr}
    ldr r3, [r1, #0x18]
    mov r2, #0x0
    str r3, [r0]
    ldr r3, [r1, #0x1c]
    str r3, [r0, #0x14]
    str r2, [r0, #0x4]
    ldr ip, [r1, #0x24]
    ldr r3, [r1, #0x18]
    ldr r4, [r1, #0x28]
    smull lr, r3, ip, r3
    mov ip, lr, lsr #0xc
    orr ip, ip, r3, lsl #0x14
    ldrh lr, [r1, #0x2c]
    rsb r3, ip, #0x0
    ldr ip, [r1, #0x1c]
    rsb r4, r4, #0x0
    mul r3, lr, r3
    smull lr, ip, r4, ip
    mov r3, r3, lsl #0x4
    str r3, [r0, #0x30]
    mov r4, lr, lsr #0xc
    ldrh r3, [r1, #0x2e]
    ldr r1, [r1, #0x1c]
    orr r4, r4, ip, lsl #0x14
    add r1, r1, r4
    rsb r3, r3, #0x0
    sub r1, r1, #0x1000
    mul r1, r3, r1
    mov r1, r1, lsl #0x4
    str r1, [r0, #0x34]
    str r2, [r0, #0x10]
    ldmia sp!, {r4, pc}
