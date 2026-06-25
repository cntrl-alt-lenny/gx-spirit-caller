; func_0201f2a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191e60
        .extern func_0201f148
        .extern func_0201f2f8
        .extern func_0209ed1c
        .global func_0201f2a0
        .arm
func_0201f2a0:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x30]
    sub r0, r0, #0x4
    cmp r0, #0x2
    movls r0, #0x1
    ldmlsia sp!, {r3, pc}
    ldr r0, _LIT1
    bl func_0209ed1c
    cmp r0, #0x2
    beq .L_38
    bl func_0201f148
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_38:
    ldr r1, _LIT0
    mov r0, #0x0
    strh r0, [r1, #0x4]
    mov r0, #0x1
    strh r0, [r1, #0xa]
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191e60
_LIT1: .word func_0201f2f8
