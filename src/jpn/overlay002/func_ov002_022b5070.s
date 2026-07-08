; func_ov002_022b5070 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ce2a0
        .extern func_02021174
        .extern func_02021278
        .extern func_02021428
        .extern func_020221e0
        .extern func_020221f8
        .extern func_0202c96c
        .extern func_0208c7e4
        .extern func_0208ce70
        .extern func_0208d944
        .extern func_0208e504
        .extern func_0208e6c4
        .global func_ov002_022b5070
        .arm
func_ov002_022b5070:
    stmdb sp!, {r3, r4, r5, lr}
    movs r4, r1
    mov r5, r0
    beq .L_f4
    bl func_0208ce70
    mov r0, #0x60
    bl func_0208d944
    mov r0, #0x1
    mov r2, r0
    mov r1, #0x0
    bl func_0208c7e4
    bl func_0208e6c4
    ldr lr, _LIT0
    ldr r2, _LIT1
    ldrh r3, [lr]
    mov r0, #0x0
    mov r1, #0x1f
    and r3, r3, r2
    strh r3, [lr]
    mov r2, r2, lsr #0x11
    ldrh ip, [lr]
    mov r3, #0x3f
    bic ip, ip, #0x3000
    orr ip, ip, #0x10
    strh ip, [lr]
    str r0, [sp]
    bl func_0208e504
    ldr r2, _LIT2
    ldr r1, _LIT3
    mov r0, #0x0
    str r2, [r1]
    str r0, [r1, #-308]
    ldr r1, _LIT4
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0xe00
    strh r0, [r1]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0xf00
    strh r0, [r1, #0x2]
    ldr r0, [r5]
    cmp r0, #0x0
    bne .L_d4
    ldr r0, _LIT5
    bl func_02021174
    str r0, [r5]
.L_d4:
    ldr r0, [r5]
    bl func_02021428
    mov r0, #0x0
    bl func_020221f8
    orr r1, r0, #0x4
    mov r0, #0x0
    bl func_020221e0
    b .L_120
.L_f4:
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_10c
    bl func_02021278
    mov r0, #0x0
    str r0, [r5]
.L_10c:
    mov r0, #0x0
    bl func_020221f8
    bic r1, r0, #0x4
    mov r0, #0x0
    bl func_020221e0
.L_120:
    mov r0, r4
    bl func_0202c96c
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x04000060
_LIT1: .word 0xffffcffd
_LIT2: .word 0xbfff0000
_LIT3: .word 0x04000580
_LIT4: .word 0x0400000c
_LIT5: .word data_020ce2a0
