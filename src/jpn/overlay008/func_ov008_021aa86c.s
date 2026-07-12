; func_ov008_021aa86c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_ov008_021b2660
        .extern data_ov008_021b2bcc
        .extern data_ov008_021b2c08
        .extern func_02001a14
        .extern func_02001d48
        .extern func_02005be0
        .extern func_02005ec4
        .extern func_02009dd0
        .extern func_02009e80
        .extern func_0201a4a8
        .extern func_0202ada4
        .extern func_0202adc8
        .extern func_0202c01c
        .extern func_0202c1f8
        .extern func_0202c21c
        .extern func_02094410
        .extern func_ov008_021aa4f8
        .extern func_ov008_021aa5c4
        .extern func_ov008_021ab084
        .extern func_ov008_021ac1cc
        .extern func_ov008_021ad984
        .extern func_ov008_021b1f40
        .global func_ov008_021aa86c
        .arm
func_ov008_021aa86c:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0xb70]
    cmp r0, #0x0
    bne .L_13c
    ldr r1, _LIT1
    mov r0, #0x0
    mov r2, #0x640
    bl func_02094410
    ldr r0, _LIT0
    ldr r2, _LIT2
    ldr r1, [r0, #0x38]
    mov r0, #0x3
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [r2, #0x8]
    bl func_02005be0
    bl func_02005ec4
    mov r0, #0x24
    bl func_02001a14
    ldr r0, _LIT3
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, _LIT4
    bl func_0202ada4
    ldr r0, _LIT3
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202adc8
    ldr r0, _LIT3
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c01c
    ldr r0, _LIT5
    bl func_0202c1f8
    ldr r0, _LIT3
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c21c
    bl func_0201a4a8
    cmp r0, #0x1
    ldreq r0, _LIT2
    moveq r1, #0x1
    ldr r3, _LIT3
    streq r1, [r0, #0x568]
    ldr r0, [r3, #0x90c]
    mov r0, r0, lsl #0x7
    movs r0, r0, lsr #0x1f
    beq .L_114
    mov r2, #0x0
.L_dc:
    add r0, r3, #0x1000
    ldrb r1, [r0, #0x56c]
    cmp r1, #0x0
    ldrneb r0, [r0, #0x56d]
    cmpne r0, #0x0
    bne .L_104
    add r2, r2, #0x1
    cmp r2, #0x1a
    add r3, r3, #0x1c
    blt .L_dc
.L_104:
    cmp r2, #0x1a
    blt .L_114
    bl func_02009dd0
    bl func_02009e80
.L_114:
    bl func_ov008_021aa4f8
    bl func_ov008_021aa5c4
    bl func_ov008_021ab084
    bl func_ov008_021b1f40
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xb70]
    add r2, r2, #0x1
    str r2, [r1, #0xb70]
    ldmia sp!, {r3, pc}
.L_13c:
    bl func_ov008_021ac1cc
    mov r0, #0x1
    bl func_ov008_021ad984
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_02103fcc
_LIT1: .word data_ov008_021b2660
_LIT2: .word data_ov008_021b2660
_LIT3: .word data_02104e6c
_LIT4: .word data_ov008_021b2bcc
_LIT5: .word data_ov008_021b2c08
