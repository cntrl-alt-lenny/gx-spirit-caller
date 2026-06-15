; func_ov004_021d2aac - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern func_0201cbd8
        .extern func_0201cd1c
        .extern func_0201cfe0
        .extern func_02037208
        .extern func_ov004_021cfbec
        .extern func_ov004_021d1118
        .global func_ov004_021d2aac
        .arm
func_ov004_021d2aac:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x200
    add r1, sp, #0x0
    mov r0, #0x6
    ldr r4, _LIT0
    bl func_0201cbd8
    cmp r0, #0x0
    addeq sp, sp, #0x200
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [sp]
    sub r0, r0, #0xa
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_608
    b .L_4dc
    b .L_4f0
    b .L_510
    b .L_608
    b .L_564
    b .L_58c
    b .L_5e4
.L_4dc:
    mov r1, #0x1
    mov r0, #0x4
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_608
.L_4f0:
    add r0, r4, #0x3000
    mov r1, #0x0
    mov r2, #0x1
    str r2, [r0, #0xc7c]
    str r1, [r0, #0xc10]
    str r1, [r0, #0xc6c]
    str r1, [r0, #0xc70]
    b .L_608
.L_510:
    ldrh r0, [sp, #0x2]
    add r6, r4, #0x3000
    mov r5, #0x0
    str r5, [r6, #0xc7c]
    str r0, [r6, #0xc10]
    str r5, [r6, #0xc68]
    cmp r0, #0x0
    ble .L_608
    add r7, sp, #0x0
.L_534:
    add r0, r7, r5, lsl #0x1
    ldrh r1, [r0, #0x4]
    add r0, r4, r5, lsl #0x2
    add r0, r0, #0x3000
    str r1, [r0, #0xc3c]
    add r0, r5, #0xa
    bl func_ov004_021cfbec
    ldr r0, [r6, #0xc10]
    add r5, r5, #0x1
    cmp r5, r0
    blt .L_534
    b .L_608
.L_564:
    ldrh r5, [sp, #0x2]
    mov r0, #0x3a
    add r4, r4, #0x3000
    mov r3, #0x1
    sub r1, r0, #0x3b
    mov r2, #0x0
    str r5, [r4, #0xc64]
    str r3, [r4, #0xc70]
    bl func_02037208
    b .L_608
.L_58c:
    ldrh r0, [sp, #0x2]
    cmp r0, #0x0
    beq .L_5b8
    mov r0, #0x3a
    add r4, r4, #0x3000
    mov r3, #0x1
    sub r1, r0, #0x3b
    mov r2, #0x0
    str r3, [r4, #0xc78]
    bl func_02037208
    b .L_608
.L_5b8:
    ldr r0, [r4, #0x54]
    cmp r0, #0xf
    bne .L_5cc
    mov r0, #0x0
    bl func_ov004_021d1118
.L_5cc:
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_608
.L_5e4:
    bl func_0201cfe0
    cmp r0, #0x0
    bne .L_600
    add r1, sp, #0x0
    mov r0, #0x6
    mov r2, #0x2
    bl func_0201cd1c
.L_600:
    mov r0, #0x1
    bl func_ov004_021d1118
.L_608:
    mov r0, #0x1
    add sp, sp, #0x200
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov004_0220b500
