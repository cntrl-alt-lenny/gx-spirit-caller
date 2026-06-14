; func_ov011_021d1b70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3594
        .extern data_ov011_021d35ac
        .extern data_ov011_021d403c
        .extern func_0201b690
        .extern func_ov011_021cf048
        .extern func_ov011_021d191c
        .extern func_ov011_021d1c80
        .extern func_ov011_021d1ce8
        .global func_ov011_021d1b70
        .arm
func_ov011_021d1b70:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    cmp r6, #0x7d
    ldr r4, _LIT0
    blt .L_2c
    sub r1, r6, #0x7d
    mov r0, #0x6
    mul r2, r1, r0
    ldr r0, _LIT1
    ldrsb r5, [r0, r2]
    b .L_50
.L_2c:
    cmp r6, #0x66
    blt .L_48
    sub r1, r6, #0x66
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1
    ldrsb r5, [r0, r1]
    b .L_50
.L_48:
    bl func_0201b690
    mov r5, r0
.L_50:
    ldr r1, [r4, #0x284]
    ldr r0, [r4, #0x264]
    bic r2, r1, #0xff000
    mov r1, r6, lsl #0x18
    orr r1, r2, r1, lsr #0xc
    str r1, [r4, #0x284]
    cmp r0, #0x0
    beq .L_7c
    cmp r0, #0x1
    beq .L_a8
    ldmia sp!, {r4, r5, r6, pc}
.L_7c:
    bl func_ov011_021cf048
    mov r0, r5
    bl func_ov011_021d1c80
    ldr r1, [r4, #0x284]
    mov r0, r5, lsl #0x1c
    bic r1, r1, #0xf00
    orr r0, r1, r0, lsr #0x14
    bic r0, r0, #0xff
    orr r0, r0, #0x4
    str r0, [r4, #0x284]
    ldmia sp!, {r4, r5, r6, pc}
.L_a8:
    ldr r0, [r4, #0x268]
    mov r0, r0, lsl #0x17
    cmp r5, r0, lsr #0x1c
    bne .L_e0
    mov r0, r6
    bl func_ov011_021d191c
    ldr r1, [r4, #0x284]
    mov r0, r5, lsl #0x1c
    bic r1, r1, #0xff
    orr r1, r1, #0x7
    bic r1, r1, #0xf00
    orr r0, r1, r0, lsr #0x14
    str r0, [r4, #0x284]
    ldmia sp!, {r4, r5, r6, pc}
.L_e0:
    bl func_ov011_021d1ce8
    ldr r1, [r4, #0x284]
    mov r0, r5, lsl #0x1c
    bic r1, r1, #0xff
    orr r1, r1, #0x3
    bic r1, r1, #0xf00
    orr r0, r1, r0, lsr #0x14
    str r0, [r4, #0x284]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov011_021d403c
_LIT1: .word data_ov011_021d3594
_LIT2: .word data_ov011_021d35ac
