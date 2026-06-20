; func_ov002_02234350 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern func_0202eac8
        .extern func_ov002_021bc000
        .extern func_ov002_021c1e44
        .extern func_ov002_021d479c
        .extern func_ov002_021e276c
        .global func_ov002_02234350
        .arm
func_ov002_02234350:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    add r0, r0, #0xee
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_114
    mov r0, r1, lsl #0x1f
    ldr r1, _LIT0
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc000
    cmp r0, #0x0
    beq .L_114
    ldr r0, _LIT1
    ldr r1, [r0, #0xd0]
    mvn r0, r1
    and r0, r0, r1, lsr #0x1
    tst r0, #0x1
    beq .L_114
    ldr ip, _LIT2
    ldr r0, _LIT3
    ldr r1, [ip]
    ldr r2, [ip, #0x1c]
    and r3, r1, #0x1
    mul r0, r3, r0
    mov r3, #0x14
    ldr r5, _LIT4
    mul r3, r2, r3
    add r5, r5, r0
    add r5, r5, #0x30
    ldr lr, [r5, r3]
    ldr r5, [ip, #0x28]
    mov ip, lr, lsl #0x2
    mov ip, ip, lsr #0x18
    mov lr, lr, lsl #0x12
    mov ip, ip, lsl #0x1
    add ip, ip, lr, lsr #0x1f
    cmp r5, ip
    bne .L_114
    ldr ip, _LIT5
    add r0, ip, r0
    ldrh r0, [r3, r0]
    cmp r0, #0x0
    beq .L_114
    mov r0, r4
    bl func_ov002_021c1e44
    cmp r0, #0x0
    bne .L_114
    ldr r0, _LIT2
    ldr r0, [r0]
    cmp r0, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, _LIT2
    orr r2, r1, #0x20
    ldr r1, [r0, #0x1c]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d479c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_114:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021e276c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word func_0202eac8
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022cd3f4
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf16c
_LIT5: .word data_ov002_022cf1a4
