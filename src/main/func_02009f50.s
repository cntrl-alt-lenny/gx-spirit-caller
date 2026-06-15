; func_02009f50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104f4c
        .extern func_020a991c
        .extern func_020a9950
        .global func_02009f50
        .arm
func_02009f50:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x38]
    bl func_020a9950
    mov r6, #0x0
    ldr r7, _LIT1
    mov r5, r6
    mov r4, r6
.L_780:
    add r0, r7, #0x1000
    ldrb r0, [r0, #0x56c]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_7ec
    b .L_808
    b .L_7a8
    b .L_7bc
    b .L_7d4
    b .L_7d4
.L_7a8:
    bl func_020a991c
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1e
    add r2, r1, r0, ror #0x1e
    b .L_7f0
.L_7bc:
    bl func_020a991c
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1e
    add r0, r1, r0, ror #0x1e
    add r2, r0, #0x1
    b .L_7f0
.L_7d4:
    bl func_020a991c
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1e
    add r0, r1, r0, ror #0x1e
    add r2, r0, #0x2
    b .L_7f0
.L_7ec:
    mov r2, r5
.L_7f0:
    add r0, r7, #0x1000
    ldrb r1, [r0, #0x56d]
    cmp r1, r2
    strltb r4, [r0, #0x56d]
    subge r1, r1, r2
    strgeb r1, [r0, #0x56d]
.L_808:
    add r6, r6, #0x1
    cmp r6, #0x1a
    add r7, r7, #0x1c
    blt .L_780
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_02104f4c
