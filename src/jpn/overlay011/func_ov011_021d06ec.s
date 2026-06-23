; func_ov011_021d06ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c7304
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_02005c84
        .extern func_02005e04
        .extern func_ov000_021ab818
        .extern func_ov011_021ca458
        .extern func_ov011_021cbb58
        .extern func_ov011_021cbe64
        .extern func_ov011_021cc280
        .extern func_ov011_021cc750
        .extern func_ov011_021cc7f8
        .extern func_ov011_021ccaa8
        .extern func_ov011_021ce448
        .extern func_ov011_021cf004
        .extern func_ov011_021cf164
        .extern func_ov011_021cf57c
        .extern func_ov011_021cff20
        .extern func_ov011_021d01e0
        .extern func_ov011_021d11fc
        .extern func_ov011_021d17c0
        .extern func_ov011_021d1c40
        .global func_ov011_021d06ec
        .arm
func_ov011_021d06ec:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r1, [r0, #0x140]
    mov r5, #0x0
    orr r1, r1, #0x40
    str r1, [r0, #0x140]
    bl func_ov011_021d1c40
    ldr r0, _LIT2
    ldr r0, [r0, #0x2a0]
    cmp r0, #0x1
    bne .L_804
    bl func_ov011_021cbb58
    bl func_ov011_021cbe64
.L_804:
    bl func_ov011_021cc280
    bl func_ov011_021cf004
    bl func_ov011_021d11fc
    bl func_ov011_021d17c0
    bl func_ov011_021cf164
    bl func_ov011_021ce448
    ldr r0, [r4, #0x274]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x1c
    beq .L_838
    cmp r0, #0x1
    beq .L_844
    b .L_84c
.L_838:
    bl func_ov011_021cff20
    mov r5, r0
    b .L_84c
.L_844:
    bl func_ov011_021d01e0
    mov r5, r0
.L_84c:
    bl func_ov011_021cf57c
    bl func_ov011_021ccaa8
    ldr r0, [r4, #0x288]
    bl func_ov011_021ca458
    .word 0xebff8491
    bl func_ov011_021cc7f8
    bl func_ov011_021cc750
    mov r0, #0x1
    bl func_02005e04
    mov r0, #0x2
    bl func_02005e04
    mov r0, #0x1
    bl func_02005c84
    mov r0, #0x2
    bl func_02005c84
    bl func_ov000_021ab818
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov000_021c7304
_LIT1: .word data_ov011_021d3f5c
_LIT2: .word data_ov011_021d3f20
