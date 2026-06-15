; func_02067f3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101928
        .extern func_02055330
        .extern func_02068380
        .extern func_02068628
        .extern func_02068b54
        .extern func_0206b44c
        .global func_02067f3c
        .arm
func_02067f3c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, r2
    ldrsb r2, [r8]
    mov sl, r0
    mov r9, r1
    mov r7, r3
    cmp r2, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrb r0, [r9, #0x14]
    add r8, r8, #0x5
    sub r7, r7, #0x5
    ands r0, r0, #0x4
    beq .L_144
    ldr r0, [sl, #0x40]
    mov r6, #0x0
    cmp r0, #0x0
    ble .L_134
    ldr r4, _LIT0
.L_f0:
    mov r0, r8
    mov r1, r7
    bl func_0206b44c
    movs r5, r0
    bmi .L_134
    add r0, sl, r6
    ldrb r1, [r0, #0x2c]
    mov r0, r9
    mov r2, r8
    ldr r1, [r4, r1, lsl #0x2]
    bl func_02068b54
    ldr r0, [sl, #0x40]
    add r6, r6, #0x1
    cmp r6, r0
    add r8, r8, r5
    sub r7, r7, r5
    blt .L_f0
.L_134:
    ldrb r0, [r9, #0x14]
    orr r0, r0, #0x41
    strb r0, [r9, #0x14]
    b .L_160
.L_144:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_02068628
    ldrb r0, [r9, #0x14]
    orr r0, r0, #0x43
    strb r0, [r9, #0x14]
.L_160:
    ldrb r0, [r9, #0x14]
    and r0, r0, #0xf3
    strb r0, [r9, #0x14]
    bl func_02055330
    ldr r2, [r9, #0x1c]
    mov r1, r9
    sub r0, r0, r2
    str r0, [r9, #0x1c]
    add r0, sl, #0x8
    bl func_02068380
    ldr r3, [sl, #0x48]
    ldr r4, [sl, #0x44]
    mov r0, sl
    mov r2, r9
    mov r1, #0x0
    blx r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_02101928
