; func_020628b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101530
        .extern func_020645e0
        .global func_020628b0
        .arm
func_020628b0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    ldr r4, _LIT0
    add r3, sp, #0x4
    ldrb r5, [r4]
    ldrb r4, [r4, #0x1]
    mov lr, #0x68
    mov ip, #0x3
    strb r5, [r3]
    strb r4, [r3, #0x1]
    strb lr, [sp, #0x6]
    str ip, [sp]
    bl func_020645e0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02101530
