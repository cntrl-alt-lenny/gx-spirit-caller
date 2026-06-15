; func_02092b48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a662c
        .extern data_027e0000
        .extern func_02092368
        .global func_02092b48
        .arm
func_02092b48:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_1ec
    b .L_11c
    b .L_1ec
    b .L_12c
    b .L_16c
    b .L_17c
    b .L_1cc
    b .L_1dc
.L_11c:
    add sp, sp, #0x4
    ldr r0, _LIT0
    ldmfd sp!, {lr}
    bx lr
.L_12c:
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_14c
    bl func_02092368
    and r0, r0, #0x3
    cmp r0, #0x1
    bne .L_15c
.L_14c:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {lr}
    bx lr
.L_15c:
    add sp, sp, #0x4
    mov r0, #0x2700000
    ldmfd sp!, {lr}
    bx lr
.L_16c:
    add sp, sp, #0x4
    mov r0, #0x2000000
    ldmfd sp!, {lr}
    bx lr
.L_17c:
    ldr r0, _LIT2
    ldr r1, _LIT3
    ldr r2, _LIT4
    add r3, r0, #0x3f80
    cmp r1, #0x0
    sub r2, r3, r2
    bne .L_1b0
    ldr r1, _LIT5
    add sp, sp, #0x4
    cmp r0, r1
    movcc r0, r1
    ldmfd sp!, {lr}
    bx lr
.L_1b0:
    cmp r1, #0x0
    ldrlt r0, _LIT5
    add sp, sp, #0x4
    sublt r0, r0, r1
    subge r0, r2, r1
    ldmfd sp!, {lr}
    bx lr
.L_1cc:
    add sp, sp, #0x4
    ldr r0, _LIT6
    ldmfd sp!, {lr}
    bx lr
.L_1dc:
    add sp, sp, #0x4
    ldr r0, _LIT7
    ldmfd sp!, {lr}
    bx lr
.L_1ec:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x023e0000
_LIT1: .word data_021a662c
_LIT2: .word data_027e0000
_LIT3: .word 0x00000000
_LIT4: .word 0x00000400
_LIT5: .word 0x027e0620
_LIT6: .word 0x027ff680
_LIT7: .word 0x037f8000
