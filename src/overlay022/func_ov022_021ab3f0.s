; func_ov022_021ab3f0 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov022_021abaa0
        .extern data_ov022_021abae8
        .extern func_020058b4
        .extern func_02006e1c
        .extern func_02036590
        .global func_ov022_021ab3f0
        .arm
func_ov022_021ab3f0:
    stmdb sp!, {r4, lr}
    mov r0, #0x8f00000
    mov r1, #0x0
    ldr r4, _LIT0
    bl func_02036590
    ldr r0, _LIT1
    mov r1, #0x0
    bl func_02036590
    ldr r0, _LIT2
    ldr r0, [r0, #0x8bc]
    cmp r0, #0x0
    beq .L_f90
    ldr r0, [r4, #0x874]
    bl func_02006e1c
    mov r0, #0x0
    str r0, [r4, #0x874]
.L_f90:
    ldr r0, [r4, #0x878]
    cmp r0, #0x0
    beq .L_fa8
    bl func_02006e1c
    mov r0, #0x0
    str r0, [r4, #0x878]
.L_fa8:
    bl func_020058b4
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov022_021abae8
_LIT1: .word 0x08f00003
_LIT2: .word data_ov022_021abaa0
