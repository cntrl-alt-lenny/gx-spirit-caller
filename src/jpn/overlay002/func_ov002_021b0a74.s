; func_ov002_021b0a74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd23c
        .extern data_ov002_022cd310
        .global func_ov002_021b0a74
        .arm
func_ov002_021b0a74:
    stmdb sp!, {r3, lr}
    cmp r0, #0x35
    ldrlt r2, _LIT0
    strlt r1, [r2, r0, lsl #0x2]
    ldmltia sp!, {r3, pc}
    cmp r1, #0x0
    sub r1, r0, #0x36
    mov r0, r1, asr #0x4
    beq .L_50
    add r0, r1, r0, lsr #0x1b
    mov r2, r1, lsr #0x1f
    ldr lr, _LIT1
    mov ip, r0, asr #0x5
    rsb r1, r2, r1, lsl #0x1b
    add r0, r2, r1, ror #0x1b
    ldr r3, [lr, ip, lsl #0x2]
    mov r1, #0x1
    orr r0, r3, r1, lsl r0
    str r0, [lr, ip, lsl #0x2]
    ldmia sp!, {r3, pc}
.L_50:
    mov r2, r1, lsr #0x1f
    add r0, r1, r0, lsr #0x1b
    rsb r1, r2, r1, lsl #0x1b
    mov r3, r0, asr #0x5
    add r0, r2, r1, ror #0x1b
    mov r1, #0x1
    ldr ip, _LIT1
    mvn r0, r1, lsl r0
    ldr r1, [ip, r3, lsl #0x2]
    and r0, r1, r0
    str r0, [ip, r3, lsl #0x2]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd23c
_LIT1: .word data_ov002_022cd310
