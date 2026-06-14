; func_ov013_021cb700 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov013_021cb9b0
        .global func_ov013_021cb700
        .arm
func_ov013_021cb700:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0xb6c]
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x0
    beq .L_cc
    blx r0
    cmp r0, #0x0
    beq .L_c4
    ldr r0, _LIT0
    ldr r1, [r0, #0xb6c]
    add r1, r1, #0x1
    str r1, [r0, #0xb6c]
.L_c4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_cc:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_ov013_021cb9b0
