; func_020a1e68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3630
        .extern func_020a1f7c
        .global func_020a1e68
        .arm
func_020a1e68:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, _LIT0
    ldr r3, [r3, r0, lsl #0x2]
    cmp r3, #0x0
    beq .L_28
    cmp r3, #0x1
    beq .L_38
    cmp r3, #0x2
    bne .L_e4
.L_28:
    bl func_020a1f7c
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_38:
    cmp r1, #0x2000000
    bcc .L_b0
    ldr r0, _LIT1
    cmp r1, r0
    bcs .L_b0
    cmp r1, #0x2300000
    add r1, r1, r2
    bcs .L_6c
    cmp r1, #0x2300000
    addhi sp, sp, #0x4
    movhi r0, #0x0
    ldmhifd sp!, {lr}
    bxhi lr
.L_6c:
    cmp r1, #0x2300000
    addls sp, sp, #0x4
    movls r0, #0x1
    ldmlsfd sp!, {lr}
    bxls lr
    ldr r0, _LIT1
    cmp r1, r0
    bcs .L_a0
    cmp r2, #0x40000
    addls sp, sp, #0x4
    movls r0, #0x1
    ldmlsfd sp!, {lr}
    bxls lr
.L_a0:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {lr}
    bx lr
.L_b0:
    ldr r0, _LIT2
    cmp r1, r0
    bcc .L_f4
    ldr r0, _LIT3
    cmp r1, r0
    bcs .L_f4
    add r1, r1, r2
    cmp r1, r0
    movls r0, #0x1
    add sp, sp, #0x4
    movhi r0, #0x0
    ldmfd sp!, {lr}
    bx lr
.L_e4:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {lr}
    bx lr
.L_f4:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_020c3630
_LIT1: .word 0x023fe800
_LIT2: .word 0x037f8000
_LIT3: .word 0x0380f000
