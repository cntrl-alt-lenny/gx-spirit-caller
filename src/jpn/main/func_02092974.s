; func_02092974 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a654c
        .extern func_02092280
        .global func_02092974
        .arm
func_02092974:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_c0
    b .L_30
    b .L_c0
    b .L_40
    b .L_80
    b .L_90
    b .L_a0
    b .L_b0
.L_30:
    add sp, sp, #0x4
    ldr r0, _LIT0
    ldmfd sp!, {lr}
    bx lr
.L_40:
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_60
    bl func_02092280
    and r0, r0, #0x3
    cmp r0, #0x1
    bne .L_70
.L_60:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {lr}
    bx lr
.L_70:
    add sp, sp, #0x4
    ldr r0, _LIT2
    ldmfd sp!, {lr}
    bx lr
.L_80:
    add sp, sp, #0x4
    ldr r0, _LIT3
    ldmfd sp!, {lr}
    bx lr
.L_90:
    add sp, sp, #0x4
    ldr r0, _LIT4
    ldmfd sp!, {lr}
    bx lr
.L_a0:
    add sp, sp, #0x4
    ldr r0, _LIT5
    ldmfd sp!, {lr}
    bx lr
.L_b0:
    add sp, sp, #0x4
    ldr r0, _LIT6
    ldmfd sp!, {lr}
    bx lr
.L_c0:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x022d28a0
_LIT1: .word data_021a654c
_LIT2: .word 0x023e0000
_LIT3: .word 0x01ff8880
_LIT4: .word 0x027e0620
_LIT5: .word 0x027ff000
_LIT6: .word 0x037f8000
