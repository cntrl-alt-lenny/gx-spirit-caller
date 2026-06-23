; func_ov011_021ce2e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_02013980
        .extern func_ov011_021cac3c
        .extern func_ov011_021ccf08
        .extern func_ov011_021cdab8
        .extern func_ov011_021ce280
        .extern func_ov011_021cef38
        .global func_ov011_021ce2e0
        .arm
func_ov011_021ce2e0:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x2a0]
    cmp r0, #0x0
    beq .L_24
    cmp r0, #0x1
    beq .L_74
    b .L_11c
.L_24:
    ldr r1, [r4, #0x268]
    mov r0, r1, lsl #0x17
    movs r2, r0, lsr #0x1c
    beq .L_11c
    ldr r0, [r4, #0x280]
    mov r0, r0, lsl #0x18
    cmp r2, r0, lsr #0x18
    bne .L_11c
    mov r0, r1, lsl #0x13
    cmp r2, r0, lsr #0x1c
    beq .L_54
    bl func_ov011_021ccf08
.L_54:
    mov r0, #0x0
    str r0, [r4, #0x288]
    bl func_ov011_021ce280
    ldr r1, [r4, #0x260]
    mov r0, #0x1
    orr r1, r1, #0x100000
    str r1, [r4, #0x260]
    ldmia sp!, {r4, pc}
.L_74:
    ldr r0, [r4, #0x240]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    cmp r0, #0x3
    ldreq r0, [r4, #0x238]
    cmpeq r0, #0x0
    ldreq r0, [r4, #0x23c]
    cmpeq r0, #0x0
    bne .L_11c
    ldr r1, [r4, #0x25c]
    ldr r0, [r4, #0x258]
    mov r1, r1, lsl #0x9
    mov r1, r1, lsr #0x18
    mov r0, r0, lsl #0xe
    cmp r1, r0, lsr #0x18
    bne .L_11c
    ldr r1, [r4, #0x274]
    ldr r0, _LIT2
    and r0, r1, r0
    orr r0, r0, #0xc000
    str r0, [r4, #0x274]
    bl func_ov011_021cdab8
    cmp r0, #0x0
    bne .L_e4
    ldr r0, [r4, #0x258]
    mov r0, r0, lsl #0xe
    mov r0, r0, lsr #0x18
    bl func_ov011_021cac3c
.L_e4:
    bl func_ov011_021cdab8
    cmp r0, #0x0
    beq .L_f8
    bl func_ov011_021cef38
    bl func_ov011_021ccf08
.L_f8:
    bl func_02013980
    ldr r1, [r4, #0x260]
    mov r0, r0, lsl #0x1c
    bic r1, r1, #0xf0000
    orr r0, r1, r0, lsr #0xc
    orr r0, r0, #0x100000
    str r0, [r4, #0x260]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_11c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
_LIT2: .word 0xffe01fff
