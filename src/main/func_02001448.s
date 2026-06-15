; func_02001448 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern func_02000cc4
        .extern func_0200111c
        .extern func_02018b94
        .global func_02001448
        .arm
func_02001448:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    bl func_0200111c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    ldr r1, [r0, #0x3c]
    sub r1, r1, #0x1
    add r1, r1, #0x1
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_56c
    b .L_564
    b .L_4c4
    b .L_4fc
    b .L_554
.L_4c4:
    ldr r0, [r0, #0x40]
    cmp r0, #0x1
    beq .L_4dc
    cmp r0, #0x2
    beq .L_4ec
    b .L_56c
.L_4dc:
    bl func_02000cc4
    mov r0, #0x17
    str r0, [r4, #0xb64]
    b .L_56c
.L_4ec:
    bl func_02000cc4
    mov r0, #0x1f
    str r0, [r4, #0xb64]
    b .L_56c
.L_4fc:
    ldr r0, [r0, #0x40]
    cmp r0, #0x1
    beq .L_514
    cmp r0, #0x2
    beq .L_524
    b .L_530
.L_514:
    bl func_02000cc4
    mov r0, #0x19
    str r0, [r4, #0xb64]
    b .L_530
.L_524:
    bl func_02000cc4
    mov r0, #0x1b
    str r0, [r4, #0xb64]
.L_530:
    bl func_02018b94
    ldr r1, [r0, #0x14]
    bic r1, r1, #0xff
    str r1, [r0, #0x14]
    bl func_02018b94
    ldr r1, [r0, #0x10]
    bic r1, r1, #0x200
    str r1, [r0, #0x10]
    b .L_56c
.L_554:
    bl func_02000cc4
    mov r0, #0x2b
    str r0, [r4, #0xb64]
    b .L_56c
.L_564:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_56c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_021040ac
