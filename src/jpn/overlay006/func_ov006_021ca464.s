; func_ov006_021ca464 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208e0c4
        .extern func_02094410
        .global func_ov006_021ca464
        .arm
func_ov006_021ca464:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    bl func_0208e0c4
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094410
    ldr r0, [sl, #0x5c]
    mov r8, #0x0
    cmp r0, #0x0
    ble .L_100
.L_2c:
    ldr r1, [sl, #0x58]
    mov r7, #0x0
    cmp r1, #0x0
    ble .L_f0
    mov r4, #0x1
    mov r5, #0x2
    mov r6, r7
    mov fp, #0x6
.L_4c:
    cmp r8, #0x0
    bne .L_74
    cmp r7, #0x0
    moveq r9, r6
    beq .L_c0
    sub r0, r1, #0x1
    cmp r7, r0
    moveq r9, r5
    movne r9, r4
    b .L_c0
.L_74:
    ldr r0, [sl, #0x5c]
    sub r0, r0, #0x1
    cmp r8, r0
    bne .L_a4
    cmp r7, #0x0
    moveq r9, fp
    beq .L_c0
    sub r0, r1, #0x1
    cmp r7, r0
    moveq r9, #0x8
    movne r9, #0x7
    b .L_c0
.L_a4:
    cmp r7, #0x0
    moveq r9, #0x3
    beq .L_c0
    sub r0, r1, #0x1
    cmp r7, r0
    moveq r9, #0x5
    movne r9, #0x4
.L_c0:
    bl func_0208e0c4
    add r0, r0, r8, lsl #0x6
    ldr r3, [sl, #0x3c]
    ldr r2, [sl, #0x38]
    mov r1, r7, lsl #0x1
    add r2, r2, r9
    orr r2, r2, r3, lsl #0xc
    strh r2, [r1, r0]
    ldr r1, [sl, #0x58]
    add r7, r7, #0x1
    cmp r7, r1
    blt .L_4c
.L_f0:
    ldr r0, [sl, #0x5c]
    add r8, r8, #0x1
    cmp r8, r0
    blt .L_2c
.L_100:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
