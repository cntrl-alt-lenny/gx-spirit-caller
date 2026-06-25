; func_02080bf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094410
        .global func_02080bf4
        .arm
func_02080bf4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r3, r0
    ldrb r2, [r3, #0xc]
    ldr ip, [r3, #0x4]
    cmp r2, #0x4
    orreq r0, r1, r1, lsl #0x4
    orreq r0, r0, r0, lsl #0x8
    orreq r1, r0, r0, lsl #0x10
    orrne r0, r1, r1, lsl #0x8
    orrne r1, r0, r0, lsl #0x10
    ldr r0, [r3, #0x8]
    mov r2, r2, lsl #0x6
    mul lr, ip, r0
    mov r0, r2, asr #0x2
    add r0, r2, r0, lsr #0x1d
    mov r2, r0, asr #0x3
    mov r0, r1
    mul r2, lr, r2
    ldr r1, [r3]
    bl func_02094410
    add sp, sp, #0x4
    ldmfd sp!, {pc}
