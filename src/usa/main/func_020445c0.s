; func_020445c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d99c
        .extern data_0219d9a1
        .extern data_0219d9a6
        .extern data_0219d9a8
        .extern func_02094688
        .global func_020445c0
        .arm
func_020445c0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, _LIT0
    mov r1, r4
    mov r2, #0x6
    bl func_02094688
    ldr r3, [r4]
    mvn r0, #0x0
    ldr r2, [r4, #0x4]
    ldr r1, _LIT1
    and r0, r3, r0
    str r0, [r4]
    and r1, r2, r1
    ldr r0, _LIT2
    str r1, [r4, #0x4]
    add r1, r4, #0x8
    mov r2, #0x6
    bl func_02094688
    add ip, r4, #0x8
    ldr r1, [r4, #0x8]
    ldr r0, [ip, #0x4]
    mov r1, r1, lsr #0x3
    orr r1, r1, r0, lsl #0x1d
    str r1, [r4, #0x8]
    mov r0, r0, lsr #0x3
    str r0, [ip, #0x4]
    ldr r3, [r4, #0x8]
    mvn r0, #0x0
    ldr r2, [ip, #0x4]
    ldr r1, _LIT1
    and r0, r3, r0
    str r0, [r4, #0x8]
    and r1, r2, r1
    ldr r0, _LIT3
    str r1, [ip, #0x4]
    add r1, r4, #0x10
    mov r2, #0x2
    bl func_02094688
    ldrh r1, [r4, #0x10]
    ldr r3, _LIT4
    ldr r0, _LIT5
    mov r1, r1, asr #0x6
    strh r1, [r4, #0x10]
    ldrh ip, [r4, #0x10]
    add r1, r4, #0x12
    mov r2, #0x2
    and r3, ip, r3
    strh r3, [r4, #0x10]
    bl func_02094688
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219d99c
_LIT1: .word 0x000007ff
_LIT2: .word data_0219d9a1
_LIT3: .word data_0219d9a6
_LIT4: .word 0x000003ff
_LIT5: .word data_0219d9a8
