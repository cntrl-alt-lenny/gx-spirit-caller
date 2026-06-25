; func_0201f0e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c62b0
        .extern data_020c63a8
        .extern data_020c63b0
        .extern data_02191e60
        .global func_0201f0e4
        .arm
func_0201f0e4:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r3, [r1, #0x38]
    cmp r3, #0x0
    beq .L_2c
    ldr r2, [r1, #0x30]
    ldr r1, _LIT1
    ldr r0, _LIT2
    ldr r1, [r1, r2, lsl #0x2]
    blx r3
.L_2c:
    ldr r0, _LIT0
    str r4, [r0, #0x30]
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT1
    ldr r0, _LIT3
    ldr r1, [r1, r4, lsl #0x2]
    blx r2
    ldmia sp!, {r4, pc}
_LIT0: .word data_02191e60
_LIT1: .word data_020c62b0
_LIT2: .word data_020c63a8
_LIT3: .word data_020c63b0
