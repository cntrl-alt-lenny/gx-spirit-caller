; func_0209e3ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02093a20
        .global func_0209e3ac
        .arm
func_0209e3ac:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    add r0, sp, #0x0
    bl func_02093a20
    mov r2, #0x0
    add r1, sp, #0x0
    mov r3, r2
.L_4d0:
    ldrb r0, [r1]
    add r2, r2, #0x1
    cmp r2, #0x6
    add r0, r3, r0
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    add r1, r1, #0x1
    blt .L_4d0
    ldr r0, _LIT0
    mov r1, #0x7
    ldr r0, [r0]
    ldr r2, _LIT1
    add r0, r3, r0
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    mul r0, r3, r1
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    smull r0, r1, r2, r3
    mov r1, r1, asr #0x3
    mov r0, r3, lsr #0x1f
    ldr r2, _LIT2
    add r1, r0, r1
    smull r0, r1, r2, r1
    sub r1, r3, r0
    add r0, r1, #0xc8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    add sp, sp, #0xc
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x027ffc3c
_LIT1: .word 0x66666667
_LIT2: .word 0x00000014
