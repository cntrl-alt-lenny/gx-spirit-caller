; func_02007e8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern func_020939a4
        .global func_02007e8c
        .arm
func_02007e8c:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x50
    add r0, sp, #0x0
    bl func_020939a4
    ldr r0, _LIT0
    ldr r0, [r0, #0x34]
    cmp r0, #0x2
    bne .L_cd0
    ldrb r0, [sp]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_ce8
    b .L_cc4
    b .L_ce8
    b .L_c94
    b .L_ca0
    b .L_cac
    b .L_cb8
.L_c94:
    add sp, sp, #0x50
    mov r0, #0x3
    ldmia sp!, {r3, pc}
.L_ca0:
    add sp, sp, #0x50
    mov r0, #0x2
    ldmia sp!, {r3, pc}
.L_cac:
    add sp, sp, #0x50
    mov r0, #0x4
    ldmia sp!, {r3, pc}
.L_cb8:
    add sp, sp, #0x50
    mov r0, #0x5
    ldmia sp!, {r3, pc}
.L_cc4:
    add sp, sp, #0x50
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_cd0:
    ldrb r0, [sp]
    cmp r0, #0x0
    bne .L_ce8
    add sp, sp, #0x50
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_ce8:
    mov r0, #0x1
    add sp, sp, #0x50
    ldmia sp!, {r3, pc}
_LIT0: .word data_021040ac
