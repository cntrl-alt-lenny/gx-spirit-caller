; func_ov008_021ac128 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov008_021b2670
        .extern data_ov008_021b2ca0
        .extern func_02006148
        .extern func_ov008_021aa498
        .extern func_ov008_021b1ce8
        .extern func_ov008_021b1cfc
        .extern func_ov008_021b1dbc
        .extern func_ov008_021b1f04
        .global func_ov008_021ac128
        .arm
func_ov008_021ac128:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r0, #0x34
    ldrh r2, [r1, #0x4]
    ldr r4, _LIT1
    mov r5, #0x0
    mov r1, r2, lsl #0x10
    mov r2, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, r2, lsr #0x18
    mul r6, r1, r0
    add r0, r4, r6
    ldr r0, [r0, #0x4]
    bl func_ov008_021b1ce8
    ldrh r0, [r4, r6]
    mov r1, r5
    bl func_ov008_021b1cfc
    bl func_ov008_021b1dbc
    cmp r0, #0x0
    beq .L_1130
    mov r0, #0xe3
    mov r1, r5
    mov r2, #0x100
    mov r3, #0x14
    bl func_ov008_021aa498
    cmp r0, #0x0
    beq .L_1120
    bl func_02006148
    cmp r0, #0x0
    movne r5, #0x1
    b .L_1130
.L_1120:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x54]
    tst r0, #0x800
    movne r5, #0x1
.L_1130:
    mov r0, r5
    bl func_ov008_021b1f04
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov008_021b2ca0
_LIT1: .word data_ov008_021b2670
_LIT2: .word data_02104acc
