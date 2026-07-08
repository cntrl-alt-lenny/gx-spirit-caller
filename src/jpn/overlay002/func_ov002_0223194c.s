; func_ov002_0223194c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf0c4
        .extern data_ov002_022d008c
        .extern func_ov002_0226ae00
        .global func_ov002_0223194c
        .arm
func_ov002_0223194c:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    ldr r1, _LIT1
    ldr r3, [r2, #0xcec]
    ldr r1, [r1, #0x5ac]
    ldrh r4, [r0, #0x2]
    eor r3, r3, r1
    ldr r2, [r0, #0x14]
    mov r1, r3, lsl #0x3
    mov r1, r2, lsr r1
    mov r2, r4, lsl #0x1f
    mov lr, r4, lsl #0x1a
    ldrh ip, [r0, #0x4]
    mov r2, r2, lsr #0x1f
    ldr r0, _LIT2
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r4, _LIT3
    tst r1, #0xff
    add r4, r4, r0
    movne r1, #0x1
    mov lr, lr, lsr #0x1b
    mov r2, #0x14
    mul r2, lr, r2
    add r4, r4, #0x30
    ldr lr, [r4, r2]
    mov r4, ip, lsl #0x11
    mov ip, lr, lsl #0x2
    mov ip, ip, lsr #0x18
    mov lr, lr, lsl #0x12
    mov ip, ip, lsl #0x1
    mov r4, r4, lsr #0x17
    add ip, ip, lr, lsr #0x1f
    moveq r1, #0x0
    cmp r4, ip
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr ip, _LIT4
    add r0, ip, r0
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT1
    ldr r2, [r0, #0x5a8]
    cmp r2, #0x7e
    beq .L_110
    cmp r2, #0x7f
    beq .L_d4
    cmp r2, #0x80
    bne .L_12c
    mov r2, #0x0
    str r2, [r0, #0x5ac]
.L_d4:
    cmp r1, #0x0
    beq .L_108
    ldr r0, _LIT2
    and r2, r3, #0x1
    mul ip, r2, r0
    ldr r0, _LIT5
    ldr r0, [r0, ip]
    cmp r0, #0x0
    beq .L_108
    mov r2, #0x0
    mov r0, r3
    mov r3, r2
    bl func_ov002_0226ae00
.L_108:
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_110:
    ldr r1, [r0, #0x5ac]
    add r1, r1, #0x1
    str r1, [r0, #0x5ac]
    cmp r1, #0x2
    movlt r0, #0x7f
    movge r0, #0x0
    ldmia sp!, {r4, pc}
.L_12c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022ce1a8
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf08c
_LIT4: .word data_ov002_022cf0c4
_LIT5: .word data_ov002_022cf098
