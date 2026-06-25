; func_0208e45c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_021023bc
        .extern func_02093dec
        .extern func_02093fb8
        .global func_0208e45c
        .arm
func_0208e45c:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    cmp r0, r1
    beq .L_50
    mov r2, #0x0
    str r2, [sp]
    ldr r1, _LIT1
    mov r3, #0x10
    str r2, [sp, #0x4]
    bl func_02093dec
    ldr r0, _LIT0
    ldr r1, _LIT2
    ldr r0, [r0]
    mov r2, #0x0
    mov r3, #0x60
    bl func_02093fb8
    b .L_70
.L_50:
    ldr r1, _LIT1
    mov r0, #0x0
    mov r2, #0x10
    bl Fill32
    ldr r1, _LIT2
    mov r0, #0x0
    mov r2, #0x60
    bl Fill32
.L_70:
    mov r2, #0x0
    ldr r0, _LIT3
    mov r1, r2
.L_7c:
    add r2, r2, #0x1
    str r1, [r0]
    cmp r2, #0x20
    blt .L_7c
    add sp, sp, #0xc
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021023bc
_LIT1: .word 0x04000330
_LIT2: .word 0x04000360
_LIT3: .word 0x040004d0
