; func_ov002_02221258 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae320
        .extern func_ov002_021c3afc
        .extern func_ov002_021d46ac
        .extern func_ov002_021e26d0
        .extern func_ov002_02257a60
        .extern func_ov002_0226aea4
        .global func_ov002_02221258
        .arm
func_ov002_02221258:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x6e
    bgt .L_1e4
    bge .L_2f8
    cmp r2, #0x64
    beq .L_314
    b .L_334
.L_1e4:
    cmp r2, #0x80
    bgt .L_334
    cmp r2, #0x7f
    blt .L_334
    beq .L_268
    cmp r2, #0x80
    bne .L_334
    bl func_ov002_02257a60
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c3afc
    cmp r0, #0x0
    ldrh r0, [r4, #0x2]
    bne .L_24c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0x1
    rsb r0, r0, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x6e
    ldmia sp!, {r4, pc}
.L_24c:
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r2, #0x1
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226aea4
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_268:
    ldrh r0, [r4, #0x2]
    ldr ip, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r1, r0, lsr #0x1f
    rsb r0, r1, #0x1
    and r0, r0, #0x1
    mla lr, r0, r2, ip
    ldr r3, _LIT3
    and r1, r1, #0x1
    ldrh ip, [r3, #0xb0]
    mul r3, r1, r2
    add lr, lr, #0x120
    ldr lr, [lr, ip, lsl #0x2]
    ldr r2, _LIT4
    mov ip, lr, lsl #0x2
    mov ip, ip, lsr #0x18
    ldr r2, [r2, r3]
    mov r3, ip, lsl #0x1
    mov lr, lr, lsl #0x12
    add r3, r3, lr, lsr #0x1f
    orr ip, r0, #0x16
    mov r0, r3, lsl #0x16
    orr r3, r1, #0x16
    mov r1, r2, lsl #0x16
    orr r1, r3, r1, lsr #0x10
    orr r0, ip, r0, lsr #0x10
    mov r2, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r0, #0x3f
    mov r3, #0x0
    bl func_ov002_021d46ac
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_2f8:
    ldrh r0, [r4, #0x2]
    mov r1, #0x11
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_314:
    ldrh r0, [r4, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_334:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022d0d8c
_LIT4: .word data_ov002_022cf098
