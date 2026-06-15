; func_02020130 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191f40
        .extern data_021922e0
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_02020188
        .extern func_020a05f8
        .global func_02020130
        .arm
func_02020130:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x30]
    cmp r0, #0x6
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r0, #0x3
    bl func_0201f138
    ldr r0, _LIT1
    bl func_020a05f8
    cmp r0, #0x0
    beq .L_448
    bl func_0201f19c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_448:
    bl func_02020188
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191f40
_LIT1: .word data_021922e0
