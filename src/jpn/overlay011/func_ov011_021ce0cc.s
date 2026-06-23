; func_ov011_021ce0cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3f5c
        .extern func_0208c7e4
        .extern func_ov000_021acd6c
        .extern func_ov000_021ad580
        .extern func_ov000_021ad7fc
        .extern func_ov000_021af24c
        .extern func_ov000_021af26c
        .extern func_ov011_021c9cc0
        .extern func_ov011_021c9f5c
        .extern func_ov011_021ca244
        .extern func_ov011_021ca444
        .extern func_ov011_021cace0
        .extern func_ov011_021cb2f0
        .extern func_ov011_021cc310
        .extern func_ov011_021cc8f0
        .extern func_ov011_021ccec8
        .extern func_ov011_021ccf84
        .extern func_ov011_021cd0cc
        .extern func_ov011_021cd598
        .extern func_ov011_021cdad0
        .extern func_ov011_021cdba4
        .extern func_ov011_021cedf8
        .global func_ov011_021ce0cc
        .arm
func_ov011_021ce0cc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    cmp r0, #0x0
    ldr r4, _LIT0
    beq .L_610
    cmp r0, #0x1
    bne .L_678
    ldr r0, [r4, #0x268]
    ldr r1, [r4, #0x280]
    bic r0, r0, #0x1e000
    str r0, [r4, #0x268]
    cmp r2, #0x0
    ldreq r0, [r4, #0x270]
    mov r3, #0x1
    bic r1, r1, #0xff
    biceq r0, r0, #0xff
    str r3, [r4, #0x264]
    str r1, [r4, #0x280]
    streq r0, [r4, #0x270]
    bl func_ov011_021ca444
    ldr r0, [r4, #0x264]
    bl func_ov011_021cb2f0
    bl func_ov011_021ca244
    bl func_ov011_021cc8f0
    bl func_ov011_021cdad0
    ldr r0, [r4, #0x268]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x1c
    bl func_ov011_021ccf84
    ldr r0, [r4, #0x268]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x1c
    bl func_ov011_021cd0cc
    ldr r0, [r4, #0x280]
    mov r0, r0, lsl #0x9
    movs r0, r0, lsr #0x1f
    beq .L_5c8
    mov r0, #0x0
    bl func_ov000_021acd6c
    b .L_5d0
.L_5c8:
    mov r0, #0x1
    bl func_ov000_021acd6c
.L_5d0:
    ldr r0, _LIT1
    bl func_ov000_021af26c
    mov r0, #0xc
    bl func_ov000_021af24c
    bl func_ov011_021c9cc0
    cmp r5, #0x0
    bne .L_5f0
    bl func_ov011_021cedf8
.L_5f0:
    bl func_ov011_021ccec8
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_0208c7e4
    mov r0, #0x1
    bl func_ov011_021cace0
    b .L_678
.L_610:
    ldr r0, [r4, #0x280]
    mov r1, #0x0
    bic r0, r0, #0xff
    str r1, [r4, #0x264]
    str r0, [r4, #0x280]
    bl func_ov011_021ca444
    ldr r0, [r4, #0x264]
    bl func_ov011_021cb2f0
    bl func_ov011_021ca244
    bl func_ov011_021cc8f0
    cmp r5, #0x0
    bne .L_644
    bl func_ov011_021cedf8
.L_644:
    bl func_ov011_021ccec8
    bl func_ov011_021cdad0
    mov r0, #0x1
    mov r1, #0x3
    mov r2, #0x0
    bl func_0208c7e4
    mov r0, #0x0
    bl func_ov000_021acd6c
    ldr r0, _LIT2
    bl func_ov000_021af26c
    mov r0, #0x5
    bl func_ov000_021af24c
    bl func_ov011_021c9cc0
.L_678:
    bl func_ov011_021cd598
    bl func_ov011_021cdba4
    ldr r1, [r4, #0x268]
    ldr r0, [r4, #0x260]
    bic r1, r1, #0xf
    bic r0, r0, #0x100000
    str r1, [r4, #0x268]
    str r0, [r4, #0x260]
    bl func_ov011_021cc310
    bl func_ov011_021c9f5c
    mov r0, #0x0
    str r0, [r4, #0x23c]
    str r0, [r4, #0x238]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov011_021d3f5c
_LIT1: .word func_ov000_021ad580
_LIT2: .word func_ov000_021ad7fc
