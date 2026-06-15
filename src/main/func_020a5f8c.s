; func_020a5f8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9938
        .extern func_020a5e68
        .extern func_020a5e90
        .extern func_020a5f10
        .extern func_020a5f44
        .global func_020a5f8c
        .arm
func_020a5f8c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    ldr r2, _LIT0
    ldr r0, _LIT1
    ldrh r1, [r2]
    mov r4, #0x1
    cmp r1, r0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldrb r0, [r2, #0x5]
    mov r0, r0, lsl #0x1e
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldr r0, _LIT2
    add r1, sp, #0x0
    ldrh r0, [r0, #0x2]
    bl func_020a5e90
    add r0, sp, #0x8
    bl func_020a5f44
    mov r0, #0x8000000
    ldrb r2, [r0, #0xb2]
    cmp r2, #0x96
    bne .L_184
    ldr r1, _LIT0
    ldrh r0, [r0, #0xbe]
    ldrh r1, [r1]
    cmp r1, r0
    bne .L_1cc
.L_184:
    cmp r2, #0x96
    beq .L_1a4
    ldr r1, _LIT0
    ldr r0, _LIT3
    ldrh r1, [r1]
    ldrh r0, [r0]
    cmp r1, r0
    bne .L_1cc
.L_1a4:
    ldr r2, _LIT0
    mov r0, #0x8000000
    ldr r1, [r2, #0x8]
    ldr r0, [r0, #0xac]
    cmp r1, r0
    beq .L_1e0
    ldrb r0, [r2, #0x5]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_1e0
.L_1cc:
    ldr r1, _LIT0
    mov r4, #0x0
    ldrb r0, [r1, #0x5]
    orr r0, r0, #0x2
    strb r0, [r1, #0x5]
.L_1e0:
    add r0, sp, #0x8
    bl func_020a5f10
    ldr r0, _LIT2
    add r1, sp, #0x0
    ldrh r0, [r0, #0x2]
    bl func_020a5e68
    mov r0, r4
    add sp, sp, #0x10
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x027ffc30
_LIT1: .word 0x0000ffff
_LIT2: .word data_021a9938
_LIT3: .word 0x0801fffe
