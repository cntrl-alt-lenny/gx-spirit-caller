; func_ov002_0221c700 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae584
        .extern func_ov002_021afff0
        .extern func_ov002_021d5918
        .extern func_ov002_0226b13c
        .global func_ov002_0221c700
        .arm
func_ov002_0221c700:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    ldrh r1, [r0, #0x4]
    mov r2, r1, lsl #0x1d
    movs r2, r2, lsr #0x1f
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r3, [r0, #0x2]
    mov r4, r1, lsl #0x11
    ldr lr, _LIT0
    mov r1, r3, lsl #0x1f
    mov r2, r1, lsr #0x1f
    ldr r1, _LIT1
    and ip, r2, #0x1
    mla lr, ip, r1, lr
    mov r5, r3, lsl #0x1a
    mov r1, r5, lsr #0x1b
    mov ip, #0x14
    mul ip, r1, ip
    add lr, lr, #0x30
    ldr lr, [lr, ip]
    mov r4, r4, lsr #0x17
    mov ip, lr, lsl #0x2
    mov ip, ip, lsr #0x18
    mov lr, lr, lsl #0x12
    mov ip, ip, lsl #0x1
    add ip, ip, lr, lsr #0x1f
    cmp r4, ip
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr ip, _LIT2
    ldr ip, [ip, #0x5a8]
    cmp ip, #0x7e
    beq .L_13c
    cmp ip, #0x7f
    beq .L_11c
    cmp ip, #0x80
    bne .L_18c
    mov r1, r3, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x12
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT3
    ldr r0, [r0]
    cmp r0, r2
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT4
    ldr r0, [r0, r2, lsl #0x2]
    cmp r0, #0x1
    bne .L_108
    mov r0, #0x2
    bl func_ov002_021afff0
    ldr r1, _LIT5
    str r0, [r1, #0xd44]
    b .L_110
.L_108:
    mov r0, #0x38
    bl func_ov002_021ae584
.L_110:
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_11c:
    ldr r3, _LIT5
    mov r0, r2
    ldr r3, [r3, #0xd44]
    mov r2, #0x1
    bl func_ov002_0226b13c
    add sp, sp, #0x8
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_13c:
    ldr r3, _LIT6
    ldrh r3, [r3, #0xb2]
    cmp r3, #0x0
    beq .L_180
    mov r3, #0x7
    str r3, [sp]
    mov ip, #0x0
    and r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r3, r1, lsl #0x10
    ldr r2, _LIT3
    str ip, [sp, #0x4]
    ldr r1, [r2]
    ldr r2, [r2, #0x1c]
    mov r3, r3, lsr #0x10
    bl func_ov002_021d5918
.L_180:
    add sp, sp, #0x8
    mov r0, #0xa
    ldmia sp!, {r3, r4, r5, pc}
.L_18c:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022ce1a8
_LIT3: .word data_ov002_022cd314
_LIT4: .word data_ov002_022cd664
_LIT5: .word data_ov002_022d008c
_LIT6: .word data_ov002_022d0d8c
