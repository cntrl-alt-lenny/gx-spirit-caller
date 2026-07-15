; func_ov022_021ab310 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov022_021ab9c0
        .extern data_ov022_021aba08
        .extern func_02005898
        .extern func_02006e00
        .extern func_02036540
        .global func_ov022_021ab310
        .arm
func_ov022_021ab310:
    stmdb sp!, {r4, lr}
    mov r0, #0x8f00000
    mov r1, #0x0
    ldr r4, _LIT0
    bl func_02036540
    ldr r0, _LIT1
    mov r1, #0x0
    bl func_02036540
    ldr r0, _LIT2
    ldr r0, [r0, #0x8bc]
    cmp r0, #0x0
    beq .L_db0
    ldr r0, [r4, #0x874]
    bl func_02006e00
    mov r0, #0x0
    str r0, [r4, #0x874]
.L_db0:
    ldr r0, [r4, #0x878]
    cmp r0, #0x0
    beq .L_dc8
    bl func_02006e00
    mov r0, #0x0
    str r0, [r4, #0x878]
.L_dc8:
    bl func_02005898
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov022_021aba08
_LIT1: .word 0x08f00003
_LIT2: .word data_ov022_021ab9c0
