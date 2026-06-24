; func_02006508 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103cc4
        .extern data_027e0000
        .extern func_020918f0
        .global func_02006508
        .arm
func_02006508:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1, #0x31c]
    add r0, r0, #0x3000
    orr r2, r2, #0x1
    str r2, [r1, #0x31c]
    ldr r3, [r1, #0x334]
    ldr r2, [r0, #0xff8]
    add r3, r3, #0x1
    str r3, [r1, #0x334]
    ldr r1, [r1, #0x314]
    orr r2, r2, #0x1
    str r2, [r0, #0xff8]
    cmp r1, #0x0
    beq .L_1d4
    blx r1
.L_1d4:
    ldr r0, _LIT0
    ldr r0, [r0, #0x310]
    cmp r0, #0x0
    beq .L_1e8
    blx r0
.L_1e8:
    ldr r0, _LIT0
    ldr r0, [r0, #0x30c]
    cmp r0, #0x0
    beq .L_1fc
    blx r0
.L_1fc:
    ldr r0, _LIT0
    ldr r0, [r0]
    bl func_020918f0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02103cc4
_LIT1: .word data_027e0000
