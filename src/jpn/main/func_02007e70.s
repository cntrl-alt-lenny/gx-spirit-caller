; func_02007e70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern func_020938b0
        .global func_02007e70
        .arm
func_02007e70:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x50
    add r0, sp, #0x0
    bl func_020938b0
    ldr r0, _LIT0
    ldr r0, [r0, #0x34]
    cmp r0, #0x2
    bne .L_c98
    ldrb r0, [sp]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_cb0
    b .L_c8c
    b .L_cb0
    b .L_c5c
    b .L_c68
    b .L_c74
    b .L_c80
.L_c5c:
    add sp, sp, #0x50
    mov r0, #0x3
    ldmia sp!, {r3, pc}
.L_c68:
    add sp, sp, #0x50
    mov r0, #0x2
    ldmia sp!, {r3, pc}
.L_c74:
    add sp, sp, #0x50
    mov r0, #0x4
    ldmia sp!, {r3, pc}
.L_c80:
    add sp, sp, #0x50
    mov r0, #0x5
    ldmia sp!, {r3, pc}
.L_c8c:
    add sp, sp, #0x50
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_c98:
    ldrb r0, [sp]
    cmp r0, #0x0
    bne .L_cb0
    add sp, sp, #0x50
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_cb0:
    mov r0, #0x1
    add sp, sp, #0x50
    ldmia sp!, {r3, pc}
_LIT0: .word data_02103fcc
