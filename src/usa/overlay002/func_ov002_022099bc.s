; func_ov002_022099bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .extern data_ov002_022d008c
        .extern func_ov002_021bad9c
        .extern func_ov002_021bbc24
        .extern func_ov002_021e95b0
        .extern func_ov002_021eb7d8
        .extern func_ov002_02257790
        .global func_ov002_022099bc
        .arm
func_ov002_022099bc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r1, #0x3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbc24
    cmp r0, #0x0
    bne .L_48
    ldrh r0, [r4, #0x2]
    mov r1, #0x3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbc24
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_48:
    ldrh r0, [r4, #0x2]
    mov r1, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbc24
    cmp r0, #0x0
    bne .L_88
    ldrh r0, [r4, #0x2]
    mov r1, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbc24
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_88:
    ldrh r0, [r4, #0x2]
    mov r1, #0x5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbc24
    cmp r0, #0x0
    bne .L_c8
    ldrh r0, [r4, #0x2]
    mov r1, #0x5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbc24
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_c8:
    ldrh r0, [r4, #0x2]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbc24
    cmp r0, #0x0
    bne .L_108
    ldrh r0, [r4, #0x2]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbc24
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_108:
    ldr r1, _LIT0
    mov r0, r4
    bl func_ov002_02257790
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT1
    mov r0, r4
    bl func_ov002_02257790
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT2
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov ip, r0, lsr #0x1f
    rsb r0, ip, #0x1
    and r3, r0, #0x1
    mul r4, r3, r1
    ldr r2, [r2, r4]
    cmp r2, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    and r2, ip, #0x1
    mul r3, r2, r1
    ldr r1, _LIT4
    ldr r1, [r1, r3]
    cmp r1, #0x2
    bcc .L_1ac
    ldr r1, _LIT5
    ldr r1, [r1, #0xcf8]
    cmp r1, #0x0
    beq .L_1a4
    ldr r1, _LIT6
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    bne .L_1ac
.L_1a4:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_1ac:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word func_ov002_021e95b0
_LIT1: .word func_ov002_021eb7d8
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf098
_LIT4: .word data_ov002_022cf09c
_LIT5: .word data_ov002_022d008c
_LIT6: .word 0x0000178b
