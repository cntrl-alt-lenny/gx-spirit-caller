; func_ov004_021d6ed0 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov004_0220a0ac
        .global func_ov004_021d6ed0
        .arm
func_ov004_021d6ed0:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0xb6c]
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x0
    beq .L_7dc
    blx r0
    cmp r0, #0x0
    beq .L_7d4
    ldr r0, _LIT0
    ldr r1, [r0, #0xb6c]
    add r1, r1, #0x1
    str r1, [r0, #0xb6c]
.L_7d4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_7dc:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_ov004_0220a0ac
