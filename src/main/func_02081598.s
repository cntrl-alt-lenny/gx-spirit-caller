; func_02081598 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207ff84
        .extern func_020816f4
        .global func_02081598
        .arm
func_02081598:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    ldr ip, [sp, #0x28]
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    ands r0, ip, #0x100
    beq .L_144
    ldr r0, [r7, #0x4]
    ldr r1, [r7, #0xc]
    ldr r2, [sp, #0x2c]
    bl func_0207ff84
    ldr r1, [sp, #0x20]
    sub r0, r1, r0
    add r5, r5, r0
    b .L_17c
.L_144:
    ands r0, ip, #0x80
    beq .L_17c
    ldr r0, [r7, #0x4]
    ldr r1, [r7, #0xc]
    ldr r2, [sp, #0x2c]
    bl func_0207ff84
    ldr r2, [sp, #0x20]
    add r1, r0, #0x1
    add r0, r2, #0x1
    add r0, r0, r0, lsr #0x1f
    mov r2, r0, asr #0x1
    add r0, r1, r1, lsr #0x1f
    sub r0, r2, r0, asr #0x1
    add r5, r5, r0
.L_17c:
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x28]
    str r1, [sp]
    ldr ip, [sp, #0x2c]
    str r0, [sp, #0x4]
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    str ip, [sp, #0x8]
    bl func_020816f4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
