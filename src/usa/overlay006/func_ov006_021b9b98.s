; func_ov006_021b9b98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cb3ec
        .extern data_ov006_021cbaa8
        .extern func_02005994
        .extern func_ov006_021b9c1c
        .global func_ov006_021b9b98
        .arm
func_ov006_021b9b98:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    cmp r1, #0x100
    ldrcc r0, _LIT0
    addcc sp, sp, #0x8
    ldrccsb r0, [r0, r1]
    ldmccia sp!, {r3, pc}
    mov r0, r1, asr #0x8
    and r2, r0, #0xff
    and r0, r1, #0xff
    orr r0, r2, r0, lsl #0x8
    strh r0, [sp, #0x4]
    ldr r1, _LIT1
    ldr r0, _LIT2
    str r1, [sp]
    ldr r1, [r0, #0x4]
    add r0, sp, #0x4
    mov r2, #0xb1
    mov r3, #0x2
    bl func_02005994
    cmp r0, #0xb1
    addge sp, sp, #0x8
    mvnge r0, #0x0
    ldmgeia sp!, {r3, pc}
    ldr r1, _LIT2
    ldr r1, [r1, #0xc]
    ldrsb r0, [r1, r0]
    sub r0, r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov006_021cb3ec
_LIT1: .word func_ov006_021b9c1c
_LIT2: .word data_ov006_021cbaa8
