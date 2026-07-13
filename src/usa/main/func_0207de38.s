; func_0207de38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102024
        .global func_0207de38
        .arm
func_0207de38:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    cmp r0, #0x0
    moveq r7, #0x10
    addne r0, r0, #0xf
    bicne r7, r0, #0xf
    ldr r0, _LIT0
    cmp r7, r0
    movcs r0, #0x0
    ldmcsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r1, #0x0
    beq .L_f0
    mov lr, r7, lsr #0x1
    mov r6, #0x0
    ldr r2, _LIT1
    ldr r3, _LIT2
    ldr ip, _LIT3
    mov r0, r6
.L_44:
    ldr r5, [ip, r6, lsl #0x2]
    ldr r4, [r5, #0x8]
    cmp r4, #0x0
    beq .L_dc
    ldr r9, [r5, #0x4]
    ldr r4, [r5]
    sub r4, r9, r4
    cmp r4, r7
    bcc .L_dc
    ldrh r4, [r5, #0x10]
    cmp r4, #0x0
    beq .L_80
    cmp r4, #0x3
    beq .L_88
    b .L_90
.L_80:
    mov r4, r3
    b .L_94
.L_88:
    mov r4, r2
    b .L_94
.L_90:
    mov r4, r0
.L_94:
    ldr r9, [r4, #0x8]
    cmp r9, #0x0
    beq .L_dc
    ldr sl, [r4, #0x4]
    ldr r9, [r4]
    sub r9, sl, r9
    cmp r9, lr
    bcc .L_dc
    ldr r3, [r5]
    mov r0, #0x1
    add r2, r3, r7
    str r2, [r5]
    ldr r2, [r4]
    add r2, r2, lr
    str r2, [r4]
    ldr r2, [r5, #0x14]
    add r8, r3, r2
    b .L_14c
.L_dc:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_44
    mov r0, #0x0
    b .L_14c
.L_f0:
    ldr r3, _LIT4
    mov r5, #0x0
.L_f8:
    ldr r4, [r3, r5, lsl #0x2]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_13c
    ldr r2, [r4, #0x4]
    ldr r0, [r4]
    sub r0, r2, r0
    cmp r0, r7
    bcc .L_13c
    ldr r2, [r4, #0x4]
    mov r0, #0x1
    sub r2, r2, r7
    str r2, [r4, #0x4]
    ldr r3, [r4, #0x4]
    ldr r2, [r4, #0x14]
    add r8, r3, r2
    b .L_14c
.L_13c:
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_f8
    mov r0, #0x0
.L_14c:
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT5
    mov r2, r7, lsr #0x4
    and r0, r0, r8, lsr #0x3
    orr r0, r0, r2, lsl #0x10
    orr r0, r0, r1, lsl #0x1f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x0007fff0
_LIT1: .word data_02102024+0x4c
_LIT2: .word data_02102024+0x34
_LIT3: .word data_02102024
_LIT4: .word data_02102024+0x8
_LIT5: .word 0x0000ffff
