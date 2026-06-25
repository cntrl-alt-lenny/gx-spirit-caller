; func_0209cc48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021025f8
        .extern func_0209d05c
        .global func_0209cc48
        .arm
func_0209cc48:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r0, #-1207959552
    mov r1, #0x0
    bl func_0209d05c
    ldr r1, _LIT0
    mov r0, #0x2000
    ldr r1, [r1]
    rsb r0, r0, #0x0
    ldr r2, [r1, #0x60]
    ldr r1, _LIT1
    bic r2, r2, #0x7000000
    orr r2, r2, #-1493172224
    and r0, r2, r0
    str r0, [r1]
.L_294:
    ldr r0, [r1]
    ands r0, r0, #0x800000
    beq .L_294
    ldr r0, _LIT2
    ldr r0, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021025f8
_LIT1: .word 0x040001a4
_LIT2: .word 0x04100010
