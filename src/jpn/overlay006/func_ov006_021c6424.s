; func_ov006_021c6424 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cdf64
        .extern data_ov006_0225dd94
        .extern func_ov006_021c6e18
        .global func_ov006_021c6424
        .arm
func_ov006_021c6424:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r7, r3
    mov r5, #0x0
    str r5, [r7]
    str r5, [r7, #0x4]
    ldr r6, _LIT0
    ldr r4, _LIT1
    mov sl, r0
    mov r9, r1
    mov r8, r2
    str r5, [r7, #0x8]
.L_2c:
    mov r0, r4
    bl func_ov006_021c6e18
    cmp r0, #0x0
    ldreq r0, [r6, #0x8]
    cmpeq r0, #0x2
    beq .L_80
    ldrsh r0, [r6]
    cmp r9, r0
    ldrgesh r0, [r6, #0x2]
    cmpge r8, r0
    blt .L_80
    ldrsh r0, [r6, #0x4]
    cmp r9, r0
    ldrlesh r0, [r6, #0x6]
    cmple r8, r0
    bgt .L_80
    mov r0, #0x1
    str r0, [r7]
    ldr r1, [r6, #0x8]
    str r1, [r7, #0x4]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_80:
    add r5, r5, #0x1
    cmp r5, #0x3
    add r6, r6, #0xc
    blt .L_2c
    ldr r0, [sl, #0x4c]
    add r1, sl, #0x6c
    add r4, r1, r0, lsl #0x4
    mov r5, #0x0
    mov r2, #0x21
    mov r3, #0x31
.L_a8:
    ldr r0, [r4, #0x4]
    adds r1, r0, r5
    bmi .L_e8
    ldr r0, [r4, #0x8]
    cmp r1, r0
    bge .L_e8
    cmp r9, #0xc
    cmpge r8, r2
    blt .L_e8
    cmp r9, #0xde
    cmplt r8, r3
    bge .L_e8
    mov r0, #0x2
    stmia r7, {r0, r5}
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_e8:
    add r5, r5, #0x1
    cmp r5, #0x6
    add r2, r2, #0x16
    add r3, r3, #0x16
    blt .L_a8
    mov r0, #0x0
    str r0, [r7]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov006_021cdf64
_LIT1: .word data_ov006_0225dd94
