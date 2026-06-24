; func_020200dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191e60
        .extern data_02192200
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_02020134
        .extern func_020a0504
        .global func_020200dc
        .arm
func_020200dc:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x30]
    cmp r0, #0x6
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r0, #0x3
    bl func_0201f0e4
    ldr r0, _LIT1
    bl func_020a0504
    cmp r0, #0x0
    beq .L_58c
    bl func_0201f148
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_58c:
    bl func_02020134
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191e60
_LIT1: .word data_02192200
