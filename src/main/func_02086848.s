; func_02086848 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02086848
        .arm
func_02086848:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, [r1, #0x18]
    mov r3, #0x0
    str r2, [r0]
    ldr r2, [r1, #0x1c]
    str r2, [r0, #0x14]
    str r3, [r0, #0x4]
    ldrh r5, [r1, #0x2c]
    ldr ip, [r1, #0x24]
    ldrh r2, [r1, #0x2e]
    mul lr, ip, r5
    rsb ip, r5, #0x0
    mov ip, ip, lsl #0xb
    ldr r4, [r1, #0x18]
    sub ip, ip, lr
    smull lr, ip, r4, ip
    ldr r6, [r1, #0x28]
    mov r4, lr, lsr #0x8
    orr r4, r4, ip, lsl #0x18
    add r4, r4, r5, lsl #0xf
    str r4, [r0, #0x30]
    mul r4, r6, r2
    rsb r5, r2, #0x0
    ldr r2, [r1, #0x1c]
    add r4, r4, r5, lsl #0xb
    smull lr, ip, r2, r4
    mov r2, lr, lsr #0x8
    ldrh r1, [r1, #0x2e]
    orr r2, r2, ip, lsl #0x18
    add r1, r2, r1, lsl #0xf
    str r1, [r0, #0x34]
    str r3, [r0, #0x10]
    ldmia sp!, {r4, r5, r6, pc}
