; func_ov011_021cd210 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3284
        .extern data_ov011_021d3286
        .extern data_ov011_021d32a4
        .extern data_ov011_021d3f20
        .extern func_ov011_021cd1a4
        .global func_ov011_021cd210
        .arm
func_ov011_021cd210:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    mov r5, r1
    ldr r1, [r3, #0x2a4]
    mov r4, r2
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x1c
    sub r6, r1, #0x1
    bl func_ov011_021cd1a4
    mvn r1, #0x0
    cmp r0, r1
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, #0x72
    mul lr, r6, r1
    ldr r2, _LIT1
    ldr r1, _LIT2
    mov ip, r0, lsl #0x2
    add r2, r2, lr
    ldrh r3, [ip, r2]
    add r1, r1, lr
    ldrh r2, [ip, r1]
    ldr r1, _LIT3
    mov r3, r3, lsl #0xc
    add r1, r1, lr
    ldrb r0, [r0, r1]
    str r3, [r5]
    mov r2, r2, lsl #0xc
    str r2, [r4]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3284
_LIT2: .word data_ov011_021d3286
_LIT3: .word data_ov011_021d32a4
