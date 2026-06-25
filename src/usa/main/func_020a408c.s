; func_020a408c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02093a20
        .global func_020a408c
        .arm
func_020a408c:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    add r0, sp, #0x0
    bl func_02093a20
    mov r2, #0x0
    add r1, sp, #0x0
    mov r3, r2
.L_254:
    ldrb r0, [r1]
    add r2, r2, #0x1
    cmp r2, #0x6
    add r3, r3, r0
    add r1, r1, #0x1
    blt .L_254
    ldr r1, _LIT0
    mov r0, #0x7
    ldr r2, [r1]
    ldr r1, _LIT1
    add r2, r3, r2
    mul r3, r2, r0
    umull r1, r0, r3, r1
    ldr r2, _LIT2
    mov r0, r0, lsr #0x4
    umull r0, r1, r2, r0
    sub r0, r3, r0
    add sp, sp, #0xc
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x027ffc3c
_LIT1: .word 0xcccccccd
_LIT2: .word 0x00000014
