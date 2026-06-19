; func_ov002_022b00fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov002_022ca510
        .global func_ov002_022b00fc
        .arm
func_ov002_022b00fc:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1b
    mov lr, r0, lsr #0x1e
    add r0, lr, lr, lsr #0x1f
    movs r0, r0, asr #0x1
    mov ip, lr, lsr #0x1f
    movne r4, #0x0
    rsb r0, ip, lr, lsl #0x1f
    moveq r4, #0x10
    adds r0, ip, r0, ror #0x1f
    beq .L_534
    cmp r1, #0xe8
    bgt .L_540
    mvn r0, #0x0
    ldmia sp!, {r4, pc}
.L_534:
    cmp r1, #0x18
    mvnge r0, #0x0
    ldmgeia sp!, {r4, pc}
.L_540:
    ldr ip, _LIT1
    mov r0, #0x0
    mov lr, #0x1
.L_54c:
    tst r3, lr, lsl r0
    beq .L_568
    cmp r2, r4
    blt .L_568
    add r1, r4, #0x14
    cmp r2, r1
    ldmltia sp!, {r4, pc}
.L_568:
    ldr r1, [ip, r0, lsl #0x2]
    add r0, r0, #0x1
    cmp r0, #0x6
    add r4, r4, r1
    blt .L_54c
    mvn r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov002_022ca510
