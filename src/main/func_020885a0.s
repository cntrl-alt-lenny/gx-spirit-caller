; func_020885a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a5134
        .extern data_021a5138
        .extern func_0207d1b8
        .extern func_02088000
        .extern func_02088070
        .global func_020885a0
        .arm
func_020885a0:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1]
    cmp r0, #0x0
    bne .L_90
    ldr r0, _LIT1
    mov r1, #0x0
    bl func_0207d1b8
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0]
.L_90:
    ldr r1, _LIT2
    ldr r0, _LIT3
    str r1, [r4, #0x8]
    str r4, [r4, #0xc]
    str r0, [r4, #0x14]
    str r4, [r4, #0x18]
    mov r0, #0x0
    str r0, [r4, #0x44]
    str r0, [r4, #0x48]
    ldr r0, [r4, #0x24]
    bic r0, r0, #0x1
    str r0, [r4, #0x24]
    ldr r0, [r4, #0x24]
    bic r0, r0, #0x2
    str r0, [r4, #0x24]
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a5134
_LIT1: .word data_021a5138
_LIT2: .word func_02088070
_LIT3: .word func_02088000
