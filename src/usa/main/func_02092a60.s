; func_02092a60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a654c
        .extern data_027e0000
        .extern func_02092280
        .global func_02092a60
        .arm
func_02092a60:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_100
    b .L_30
    b .L_100
    b .L_40
    b .L_80
    b .L_90
    b .L_e0
    b .L_f0
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
    mov r0, #0x2700000
    ldmfd sp!, {lr}
    bx lr
.L_80:
    add sp, sp, #0x4
    mov r0, #0x2000000
    ldmfd sp!, {lr}
    bx lr
.L_90:
    ldr r0, _LIT2
    ldr r1, _LIT3
    ldr r2, _LIT4
    add r3, r0, #0x3f80
    cmp r1, #0x0
    sub r2, r3, r2
    bne .L_c4
    ldr r1, _LIT5
    add sp, sp, #0x4
    cmp r0, r1
    movcc r0, r1
    ldmfd sp!, {lr}
    bx lr
.L_c4:
    cmp r1, #0x0
    ldrlt r0, _LIT5
    add sp, sp, #0x4
    sublt r0, r0, r1
    subge r0, r2, r1
    ldmfd sp!, {lr}
    bx lr
.L_e0:
    add sp, sp, #0x4
    ldr r0, _LIT6
    ldmfd sp!, {lr}
    bx lr
.L_f0:
    add sp, sp, #0x4
    ldr r0, _LIT7
    ldmfd sp!, {lr}
    bx lr
.L_100:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x023e0000
_LIT1: .word data_021a654c
_LIT2: .word data_027e0000
_LIT3: .word 0x00000000
_LIT4: .word 0x00000400
_LIT5: .word 0x027e0620
_LIT6: .word 0x027ff680
_LIT7: .word 0x037f8000
