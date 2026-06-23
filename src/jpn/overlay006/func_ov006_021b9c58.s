; func_ov006_021b9c58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cb2c8
        .extern func_02005994
        .extern func_ov006_021b9c98
        .global func_ov006_021b9c58
        .arm
func_ov006_021b9c58:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    str r1, [sp, #0x4]
    ldr ip, _LIT0
    ldr r1, _LIT1
    add r0, sp, #0x4
    mov r2, #0x1c
    mov r3, #0x4
    str ip, [sp]
    bl func_02005994
    cmp r0, #0x1c
    mvnge r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word func_ov006_021b9c98
_LIT1: .word data_ov006_021cb2c8
