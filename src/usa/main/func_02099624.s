; func_02099624 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02099624
        .arm
func_02099624:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc4
    ldr r5, [sp, #0xe0]
    ldr r4, [sp, #0xe4]
    movs r9, r0
    mov r8, r1
    mov r7, r2
    mov r6, r3
    addeq sp, sp, #0xc4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    cmp r8, #0x0
    addeq sp, sp, #0xc4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    cmp r7, #0x0
    addeq sp, sp, #0xc4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    cmp r6, #0x0
    addeq sp, sp, #0xc4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    cmp r5, #0x0
    addeq sp, sp, #0xc4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    cmp r4, #0x0
    addeq sp, sp, #0xc4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    ldr r0, [r4, #0x4]
    cmp r5, r0
    ble .L_c0
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0x10]
    blx r1
    ldr r0, [r4, #0x8]
    ldr r3, [r4, #0x14]
    mov r1, r6
    mov r2, r5
    blx r3
    ldr r0, [r4, #0x8]
    ldr r2, [r4, #0x18]
    add r1, sp, #0x0
    blx r2
    ldr r5, [r4]
    add r6, sp, #0x0
.L_c0:
    cmp r5, #0x0
    mov r0, #0x0
    ble .L_e8
    add r2, sp, #0x40
.L_d0:
    ldrb r1, [r6, r0]
    add r0, r0, #0x1
    cmp r0, r5
    eor r1, r1, #0x36
    strb r1, [r2], #0x1
    blt .L_d0
.L_e8:
    ldr r1, [r4, #0x4]
    cmp r0, r1
    bge .L_114
    add r1, sp, #0x40
    add r3, r1, r0
    mov r2, #0x36
.L_100:
    strb r2, [r3], #0x1
    ldr r1, [r4, #0x4]
    add r0, r0, #0x1
    cmp r0, r1
    blt .L_100
.L_114:
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0x10]
    blx r1
    ldr r0, [r4, #0x8]
    ldr r2, [r4, #0x4]
    ldr r3, [r4, #0x14]
    add r1, sp, #0x40
    blx r3
    ldr r0, [r4, #0x8]
    ldr r3, [r4, #0x14]
    mov r1, r8
    mov r2, r7
    blx r3
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0xc]
    ldr r2, [r4, #0x18]
    blx r2
    cmp r5, #0x0
    mov r2, #0x0
    ble .L_180
    add r1, sp, #0x80
.L_168:
    ldrb r0, [r6, r2]
    add r2, r2, #0x1
    cmp r2, r5
    eor r0, r0, #0x5c
    strb r0, [r1], #0x1
    blt .L_168
.L_180:
    ldr r0, [r4, #0x4]
    cmp r2, r0
    bge .L_1ac
    add r0, sp, #0x80
    add r3, r0, r2
    mov r1, #0x5c
.L_198:
    strb r1, [r3], #0x1
    ldr r0, [r4, #0x4]
    add r2, r2, #0x1
    cmp r2, r0
    blt .L_198
.L_1ac:
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0x10]
    blx r1
    ldr r0, [r4, #0x8]
    ldr r2, [r4, #0x4]
    ldr r3, [r4, #0x14]
    add r1, sp, #0x80
    blx r3
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0xc]
    ldr r2, [r4]
    ldr r3, [r4, #0x14]
    blx r3
    ldr r0, [r4, #0x8]
    ldr r2, [r4, #0x18]
    mov r1, r9
    blx r2
    add sp, sp, #0xc4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
