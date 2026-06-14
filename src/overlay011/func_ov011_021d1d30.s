; func_ov011_021d1d30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d403c
        .extern func_ov011_021ca6ac
        .extern func_ov011_021cb218
        .extern func_ov011_021cc7f8
        .extern func_ov011_021ccf3c
        .extern func_ov011_021ccfcc
        .extern func_ov011_021cdb94
        .extern func_ov011_021ce344
        .extern func_ov011_021ceffc
        .extern func_ov011_021cf048
        .extern func_ov011_021cf060
        .extern func_ov011_021d1b48
        .extern func_ov011_021d1b70
        .global func_ov011_021d1d30
        .arm
func_ov011_021d1d30:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    ldr r0, [r4, #0x284]
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    b .L_40
    b .L_5c
    b .L_78
    b .L_e0
    b .L_114
    b .L_148
    b .L_1a0
.L_40:
    bl func_ov011_021ca6ac
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x284]
    bic r0, r0, #0xff
    str r0, [r4, #0x284]
    ldmia sp!, {r4, pc}
.L_5c:
    bl func_ov011_021cf060
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x284]
    bic r0, r0, #0xff
    str r0, [r4, #0x284]
    ldmia sp!, {r4, pc}
.L_78:
    ldr r0, [r4, #0x274]
    mov r1, r0, lsl #0x13
    movs r1, r1, lsr #0x1c
    moveq r0, r0, lsl #0xb
    moveq r0, r0, lsr #0x18
    cmpeq r0, #0x14
    beq .L_ac
    cmp r1, #0x1
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x274]
    mov r0, r0, lsl #0xb
    movs r0, r0, lsr #0x18
    ldmneia sp!, {r4, pc}
.L_ac:
    bl func_ov011_021cf048
    ldr r0, [r4, #0x284]
    ldr r2, [r4, #0x268]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1c
    bic r0, r0, #0xff
    orr r0, r0, #0x4
    bic r2, r2, #0x1e0
    mov r1, r1, lsl #0x1c
    orr r1, r2, r1, lsr #0x17
    str r1, [r4, #0x268]
    str r0, [r4, #0x284]
    ldmia sp!, {r4, pc}
.L_e0:
    bl func_ov011_021ca6ac
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x280]
    orr r0, r0, #0x200
    str r0, [r4, #0x280]
    bl func_ov011_021cb218
    bl func_ov011_021ceffc
    ldr r0, [r4, #0x284]
    bic r0, r0, #0xff
    orr r0, r0, #0x5
    str r0, [r4, #0x284]
    ldmia sp!, {r4, pc}
.L_114:
    bl func_ov011_021cf060
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov011_021cf048
    bl func_ov011_021cc7f8
    bl func_ov011_021cdb94
    bl func_ov011_021ce344
    bl func_ov011_021ccfcc
    ldr r0, [r4, #0x284]
    bic r0, r0, #0xff
    orr r0, r0, #0x6
    str r0, [r4, #0x284]
    ldmia sp!, {r4, pc}
.L_148:
    ldr r0, [r4, #0x274]
    mov r1, r0, lsl #0x13
    movs r1, r1, lsr #0x1c
    moveq r0, r0, lsl #0xb
    moveq r0, r0, lsr #0x18
    cmpeq r0, #0x14
    beq .L_17c
    cmp r1, #0x1
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x274]
    mov r0, r0, lsl #0xb
    movs r0, r0, lsr #0x18
    ldmneia sp!, {r4, pc}
.L_17c:
    ldr r0, [r4, #0x284]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x18
    bl func_ov011_021d1b70
    ldr r0, [r4, #0x284]
    bic r0, r0, #0xff
    orr r0, r0, #0x7
    str r0, [r4, #0x284]
    ldmia sp!, {r4, pc}
.L_1a0:
    bl func_ov011_021d1b48
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_ov011_021ccf3c
    ldr r0, [r4, #0x284]
    ldr r1, [r4, #0x270]
    bic r0, r0, #0xff
    bic r1, r1, #0x10000000
    bic r0, r0, #0xff00000
    str r1, [r4, #0x270]
    str r0, [r4, #0x284]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov011_021d403c
