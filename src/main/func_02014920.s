; func_02014920 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139c4
        .extern func_02018a38
        .extern func_02018a64
        .extern func_020195ec
        .extern func_02019664
        .extern func_0201969c
        .extern func_0201b7b4
        .extern func_0201b7e0
        .global func_02014920
        .arm
func_02014920:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_f0c
    b .L_f30
    b .L_f48
    b .L_f5c
    b .L_f70
    b .L_f88
    b .L_1088
.L_f0c:
    bl func_020139c4
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldreq r0, _LIT0
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_f30:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x5
    ldreq r0, _LIT1
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_f48:
    bl func_02019664
    cmp r0, #0x67
    ldreq r0, _LIT2
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_f5c:
    ldr r1, _LIT3
    mov r0, #0x13
    str r1, [r5, #0x8]
    bl func_02018a38
    ldmia sp!, {r3, r4, r5, pc}
.L_f70:
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_f88:
    ldr r0, [r4, #0x924]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_fb0
    b .L_1070
    b .L_1034
    b .L_fe4
    b .L_fb8
.L_fb0:
    mov r0, #0x5
    str r0, [r4, #0x924]
.L_fb8:
    bl func_0201969c
    cmp r0, #0x2d
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    bl func_02018a64
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_fe4:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    bne .L_1028
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x924]
    sub r0, r0, #0x1
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
.L_1028:
    ldr r0, _LIT7
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_1034:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT8
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x5
    str r0, [r4, #0x920]
    mov r0, #0x1
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
.L_1070:
    ldr r0, _LIT9
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_1088:
    ldr r0, _LIT10
    str r0, [r5, #0x8]
    bl func_0201b7b4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000a0100
_LIT1: .word 0x000a0200
_LIT2: .word 0x000a0300
_LIT3: .word 0x000a0400
_LIT4: .word 0x000a0500
_LIT5: .word 0x000a0600
_LIT6: .word 0x000a0601
_LIT7: .word 0x000a0602
_LIT8: .word 0x000a0603
_LIT9: .word 0x000a0604
_LIT10: .word 0x000a0700
