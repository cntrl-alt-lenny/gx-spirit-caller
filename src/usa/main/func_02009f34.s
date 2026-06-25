; func_02009f34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104e6c
        .extern func_020a9828
        .extern func_020a985c
        .global func_02009f34
        .arm
func_02009f34:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x38]
    bl func_020a985c
    mov r6, #0x0
    ldr r7, _LIT1
    mov r5, r6
    mov r4, r6
.L_20:
    add r0, r7, #0x1000
    ldrb r0, [r0, #0x56c]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_8c
    b .L_a8
    b .L_48
    b .L_5c
    b .L_74
    b .L_74
.L_48:
    bl func_020a9828
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1e
    add r2, r1, r0, ror #0x1e
    b .L_90
.L_5c:
    bl func_020a9828
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1e
    add r0, r1, r0, ror #0x1e
    add r2, r0, #0x1
    b .L_90
.L_74:
    bl func_020a9828
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1e
    add r0, r1, r0, ror #0x1e
    add r2, r0, #0x2
    b .L_90
.L_8c:
    mov r2, r5
.L_90:
    add r0, r7, #0x1000
    ldrb r1, [r0, #0x56d]
    cmp r1, r2
    strltb r4, [r0, #0x56d]
    subge r1, r1, r2
    strgeb r1, [r0, #0x56d]
.L_a8:
    add r6, r6, #0x1
    cmp r6, #0x1a
    add r7, r7, #0x1c
    blt .L_20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02103fcc
_LIT1: .word data_02104e6c
