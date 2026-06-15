; func_ov020_021ada74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3870
        .global func_ov020_021ada74
        .arm
func_ov020_021ada74:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r4, r0, lsl #0x1b
    and r5, r0, #0x3e0
    mov r4, r4, lsr #0x18
    and r0, r0, #0x7c00
    cmp r4, r5, asr #0x2
    mov r6, r0, asr #0x7
    mov r5, r5, asr #0x2
    movgt r0, r4
    movle r0, r5
    mov sl, r1
    mov r9, r2
    mov r8, r3
    cmp r0, r6
    ble .L_4c
    cmp r4, r5
    movgt r0, r4
    movle r0, r5
    b .L_50
.L_4c:
    mov r0, r6
.L_50:
    str r0, [r8]
    cmp r4, r5
    movgt r0, r5
    movle r0, r4
    cmp r0, r6
    movgt r0, r6
    bgt .L_78
    cmp r4, r5
    movgt r0, r5
    movle r0, r4
.L_78:
    ldr r1, [r8]
    cmp r1, #0x0
    sub r7, r1, r0
    moveq r0, #0x0
    beq .L_94
    rsb r0, r7, r7, lsl #0x8
    bl func_020b3870
.L_94:
    str r0, [r9]
    movs r1, r0
    mov r0, #0x0
    beq .L_110
    ldr r1, [r8]
    cmp r4, r1
    bne .L_c4
    sub r0, r5, r6
    mov r1, r7
    mov r0, r0, lsl #0x8
    bl func_020b3870
    b .L_100
.L_c4:
    cmp r5, r1
    bne .L_e4
    sub r0, r6, r4
    mov r1, r7
    mov r0, r0, lsl #0x8
    bl func_020b3870
    add r0, r0, #0x200
    b .L_100
.L_e4:
    cmp r6, r1
    bne .L_100
    sub r0, r4, r5
    mov r1, r7
    mov r0, r0, lsl #0x8
    bl func_020b3870
    add r0, r0, #0x400
.L_100:
    mov r1, #0x3c
    mul r1, r0, r1
    movs r0, r1, asr #0x8
    addmi r0, r0, #0x168
.L_110:
    str r0, [sl]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
