; func_0203d090 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203cfa8
        .extern func_0203d028
        .global func_0203d090
        .arm
func_0203d090:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r3
    ldrb r3, [r6, #0xd12]
    mvn r4, #0x0
    mov r5, #0x0
    cmp r3, #0x0
    ble .L_98
    ldr lr, _LIT0
    ldrb ip, [r1, #0x4]
    add lr, r6, lr
.L_28:
    ldrb r7, [lr]
    cmp ip, r7
    bne .L_88
    ldrb r8, [r1, #0x5]
    ldrb r7, [lr, #0x1]
    cmp r8, r7
    bne .L_88
    ldrb r8, [r1, #0x6]
    ldrb r7, [lr, #0x2]
    cmp r8, r7
    bne .L_88
    ldrb r8, [r1, #0x7]
    ldrb r7, [lr, #0x3]
    cmp r8, r7
    bne .L_88
    ldrb r8, [r1, #0x8]
    ldrb r7, [lr, #0x4]
    cmp r8, r7
    bne .L_88
    ldrb r8, [r1, #0x9]
    ldrb r7, [lr, #0x5]
    cmp r8, r7
    moveq r4, r5
    beq .L_98
.L_88:
    add r5, r5, #0x1
    cmp r5, r3
    add lr, lr, #0xc0
    blt .L_28
.L_98:
    mvn r3, #0x0
    cmp r4, r3
    bne .L_c8
    mov r3, r6
    and r0, r0, #0xff
    bl func_0203d028
    ldrb r0, [r6, #0xd12]
    mov r4, #0xa
    cmp r0, #0xa
    addcc r0, r0, #0x1
    strccb r0, [r6, #0xd12]
    b .L_d4
.L_c8:
    mov r0, r4
    mov r3, r6
    bl func_0203cfa8
.L_d4:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000474
