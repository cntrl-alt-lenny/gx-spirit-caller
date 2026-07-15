; func_ov013_021ca62c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov013_021cba40
        .extern data_ov013_021cba60
        .extern data_ov013_021cba80
        .extern data_ov013_021cba9c
        .extern data_ov013_021cbab4
        .extern data_ov013_021cbad0
        .extern data_ov013_021cbb20
        .extern data_ov013_021cbb5c
        .extern func_0201a4a8
        .extern func_0201a7e4
        .global func_ov013_021ca62c
        .arm
func_ov013_021ca62c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x1a4]
    mov r5, #0x0
    mov r0, r0, lsl #0xb
    movs r0, r0, lsr #0x1d
    beq .L_2c
    cmp r0, #0x1
    beq .L_50
    b .L_7c
.L_2c:
    bl func_0201a4a8
    cmp r0, #0x1
    beq .L_48
    cmp r0, #0x2
    cmpne r0, #0x3
    ldreq r5, _LIT2
    b .L_80
.L_48:
    ldr r5, _LIT3
    b .L_80
.L_50:
    bl func_0201a7e4
    cmp r0, #0x0
    beq .L_74
    ldr r0, [r4, #0x17c]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldrne r5, _LIT4
    ldreq r5, _LIT5
    b .L_80
.L_74:
    ldr r5, _LIT6
    b .L_80
.L_7c:
    ldr r5, _LIT7
.L_80:
    cmp r5, #0x0
    beq .L_90
    mov r0, r5
    .word 0xebff9b03
.L_90:
    cmp r5, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov013_021cbb20
_LIT1: .word data_ov013_021cbb5c
_LIT2: .word data_ov013_021cba60
_LIT3: .word data_ov013_021cba40
_LIT4: .word data_ov013_021cba80
_LIT5: .word data_ov013_021cba9c
_LIT6: .word data_ov013_021cbab4
_LIT7: .word data_ov013_021cbad0
