; func_ov002_02237024 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_0202b824
        .extern func_0202b86c
        .extern func_ov002_021c97ac
        .extern func_ov002_021ca4dc
        .extern func_ov002_021d46ac
        .extern func_ov002_021d86ec
        .extern func_ov002_021e1304
        .extern func_ov002_021e267c
        .extern func_ov002_021e2728
        .global func_ov002_02237024
        .arm
func_ov002_02237024:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r0, [r6, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r4, r3, r1
    ldr r1, [r2, r4]
    cmp r1, #0x0
    beq .L_4e8
    ldr r2, _LIT2
    mov r1, #0xd
    add r2, r2, r4
    ldr r4, [r2, #0x260]
    mov r2, #0x0
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov ip, r4, lsl #0x13
    mov r5, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    mov r4, ip, lsr #0x13
    add r5, r3, r5, lsr #0x1f
    bl func_ov002_021c97ac
    cmp r0, #0x0
    bne .L_438
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e2728
.L_438:
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d86ec
    mov r0, r4
    bl func_0202b824
    cmp r0, #0x16
    bne .L_4b4
    mov r0, r4
    bl func_0202b86c
    cmp r0, #0x0
    bne .L_4b4
    ldrh r0, [r6, #0x2]
    mov r1, #0x1
    mov r2, r1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e1304
    mov r0, r5
    bl func_ov002_021ca4dc
    cmp r0, #0x0
    beq .L_4e8
    ldrh r0, [r6, #0x2]
    mov r2, r5, lsl #0x10
    ldrh r1, [r6]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, r2, lsr #0x10
    mov r2, #0x21
    bl func_ov002_021e267c
    b .L_4e8
.L_4b4:
    ldrh r0, [r6, #0x2]
    mov r1, r5, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x57
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, #0xd
    mov r3, #0x1
    bl func_ov002_021d46ac
.L_4e8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf08c
