; func_0209e0a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209e0a8
        .arm
func_0209e0a8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x88
    ldrh r2, [r1, #0x3c]
    mov lr, r0
    cmp r2, #0x0
    beq .L_4c
    mov r0, #0x0
    add r5, sp, #0x0
    strb r0, [sp]
    mov r4, #0x8
.L_28:
    ldmia r5!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_28
    ldr r0, [r5]
    add sp, sp, #0x88
    str r0, [lr]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_4c:
    ldrh r0, [r1, #0x3e]
    strb r0, [sp]
    ldrb r0, [sp]
    cmp r0, #0x0
    bne .L_8c
    add r5, sp, #0x0
    mov r4, #0x8
.L_68:
    ldmia r5!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_68
    ldr r0, [r5]
    add sp, sp, #0x88
    str r0, [lr]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_8c:
    cmp r0, #0x10
    movhi r0, #0x10
    strhib r0, [sp]
    ldrh r2, [r1]
    ldrb r3, [sp]
    mov r0, #0x0
    mov r2, r2, lsl #0x1
    sub r4, r2, #0x40
    cmp r3, #0x0
    add r3, r1, #0x40
    mov r2, r0
    and r1, r4, #0xff
    ble .L_140
    add ip, sp, #0x0
.L_c4:
    ldrb r5, [r3]
    add r6, ip, r2, lsl #0x3
    add r4, r3, #0x2
    strb r5, [r6, #0x4]
    ldrb r5, [r3, #0x1]
    strb r5, [r6, #0x5]
    str r4, [r6, #0x8]
    ldrb r4, [r6, #0x5]
    add r4, r4, #0x2
    and r5, r4, #0xff
    add r0, r0, r5
    and r0, r0, #0xff
    cmp r0, r1
    bls .L_12c
    mov r0, #0x0
    strb r0, [sp]
    mov r4, #0x8
.L_108:
    ldmia ip!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_108
    ldr r0, [ip]
    add sp, sp, #0x88
    str r0, [lr]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_12c:
    ldrb r4, [sp]
    add r2, r2, #0x1
    add r3, r3, r5
    cmp r2, r4
    blt .L_c4
.L_140:
    add r4, sp, #0x0
    mov ip, #0x8
.L_148:
    ldmia r4!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_148
    ldr r0, [r4]
    str r0, [lr]
    add sp, sp, #0x88
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
