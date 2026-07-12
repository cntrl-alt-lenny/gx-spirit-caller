; func_ov008_021af3a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2660
        .extern data_ov008_021b2688
        .extern func_ov008_021aecd8
        .extern func_ov008_021aed30
        .global func_ov008_021af3a0
        .arm
func_ov008_021af3a0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    bl func_ov008_021aecd8
    mov r4, r0
    mov r0, r5
    bl func_ov008_021aed30
    mov r1, #0x34
    mul r3, r4, r1
    ldr r4, _LIT0
    mov r2, #0x0
    mov r1, r2
    add r6, r4, r3
    mov r5, #0x1
.L_3a4:
    mov ip, r1, asr #0x4
    add ip, r1, ip, lsr #0x1b
    mov r4, ip, asr #0x5
    mov lr, r1, lsr #0x1f
    add r4, r6, r4, lsl #0x2
    rsb ip, lr, r1, lsl #0x1b
    ldr r4, [r4, #0x20]
    add ip, lr, ip, ror #0x1b
    tst r4, r5, lsl ip
    beq .L_3d8
    cmp r2, r0
    beq .L_3e4
    add r2, r2, #0x1
.L_3d8:
    add r1, r1, #0x1
    cmp r1, #0x40
    blt .L_3a4
.L_3e4:
    mov r0, r1, asr #0x3
    ldr ip, _LIT1
    add r0, r1, r0, lsr #0x1c
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1c
    add r1, r2, r1, ror #0x1c
    mov lr, r0, asr #0x4
    add r3, ip, r3
    mov r2, r1, lsl #0x1
    mov r0, #0x3
    ldr r1, [r3, lr, lsl #0x2]
    mvn r0, r0, lsl r2
    and r0, r1, r0
    mov r2, r1, lsr r2
    str r0, [r3, lr, lsl #0x2]
    ands r0, r2, #0x3
    addeq r0, r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov008_021b2660
_LIT1: .word data_ov008_021b2688
