; func_ov003_021cbb78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201ef3c
        .global func_ov003_021cbb78
        .arm
func_ov003_021cbb78:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    mov sl, r0
    add r0, sl, #0xc4
    str r0, [sp, #0x2c]
    add r0, sl, #0xc0
    str r0, [sp, #0x28]
    add r0, sl, #0xe4
    str r0, [sp, #0x24]
    add r0, sl, #0xd4
    str r0, [sp, #0x20]
    add r0, sl, #0x11c
    str r0, [sp, #0x1c]
    add r0, sl, #0xf4
    str r0, [sp, #0x18]
    add r0, sl, #0x50
    str r0, [sp, #0x14]
    add r0, sl, #0x40
    str r0, [sp, #0x10]
    add r0, sl, #0x70
    str r0, [sp, #0xc]
    add r0, sl, #0x60
    str r0, [sp, #0x8]
    add r0, sl, #0x320
    str r0, [sp, #0x4]
    add r0, sl, #0x1b8
    mov r5, sl
    mov r6, sl
    mov r9, #0x0
    str r0, [sp]
.L_1934:
    ldr r0, [r5, #0xc4]
    cmp r0, #0x0
    beq .L_195c
    ldr r0, [r5, #0xb8]
    ldr r1, [sp, #0x28]
    ldr r2, [sp, #0x2c]
    bl func_0201ef3c
    mov r0, #0x0
    str r0, [r5, #0xc8]
    str r0, [r5, #0xc4]
.L_195c:
    ldr r0, [r5, #0xe4]
    cmp r0, #0x0
    beq .L_1984
    ldr r0, [r5, #0xcc]
    ldr r1, [sp, #0x20]
    ldr r2, [sp, #0x24]
    bl func_0201ef3c
    mov r0, #0x0
    str r0, [r5, #0xe8]
    str r0, [r5, #0xe4]
.L_1984:
    ldr r0, [r5, #0x11c]
    cmp r0, #0x0
    beq .L_19ac
    ldr r0, [r5, #0xec]
    ldr r1, [sp, #0x18]
    ldr r2, [sp, #0x1c]
    bl func_0201ef3c
    mov r0, #0x0
    str r0, [r5, #0x120]
    str r0, [r5, #0x11c]
.L_19ac:
    add r1, sl, r9, lsl #0x6
    ldr r0, [r1, #0x50]
    cmp r0, #0x0
    beq .L_19dc
    ldr r0, [r1, #0x38]
    ldr r1, [sp, #0x10]
    ldr r2, [sp, #0x14]
    bl func_0201ef3c
    mov r1, #0x0
    add r0, sl, r9, lsl #0x6
    str r1, [r0, #0x54]
    str r1, [r0, #0x50]
.L_19dc:
    add r1, sl, r9, lsl #0x6
    ldr r0, [r1, #0x70]
    cmp r0, #0x0
    beq .L_1a0c
    ldr r0, [r1, #0x58]
    ldr r1, [sp, #0x8]
    ldr r2, [sp, #0xc]
    bl func_0201ef3c
    mov r1, #0x0
    add r0, sl, r9, lsl #0x6
    str r1, [r0, #0x74]
    str r1, [r0, #0x70]
.L_1a0c:
    mov r4, #0x0
    ldr r7, [sp, #0x4]
    ldr r8, [sp]
    mov fp, r4
.L_1a1c:
    add r0, r6, r4, lsl #0x3
    ldr r0, [r0, #0x320]
    cmp r0, #0x0
    beq .L_1a4c
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0x190]
    mov r1, r8
    mov r2, r7
    bl func_0201ef3c
    add r0, r6, r4, lsl #0x3
    str fp, [r0, #0x324]
    str fp, [r0, #0x320]
.L_1a4c:
    add r7, r7, #0x8
    add r8, r8, #0x48
    add r4, r4, #0x1
    cmp r4, #0x5
    blt .L_1a1c
    ldr r0, [sp, #0x2c]
    add r9, r9, #0x1
    add r0, r0, #0x6c
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x28]
    add r5, r5, #0x6c
    add r0, r0, #0x6c
    str r0, [sp, #0x28]
    ldr r0, [sp, #0x24]
    add r6, r6, #0x1b8
    add r0, r0, #0x6c
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x20]
    cmp r9, #0x2
    add r0, r0, #0x6c
    str r0, [sp, #0x20]
    ldr r0, [sp, #0x1c]
    add r0, r0, #0x6c
    str r0, [sp, #0x1c]
    ldr r0, [sp, #0x18]
    add r0, r0, #0x6c
    str r0, [sp, #0x18]
    ldr r0, [sp, #0x14]
    add r0, r0, #0x40
    str r0, [sp, #0x14]
    ldr r0, [sp, #0x10]
    add r0, r0, #0x40
    str r0, [sp, #0x10]
    ldr r0, [sp, #0xc]
    add r0, r0, #0x40
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x8]
    add r0, r0, #0x40
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x4]
    add r0, r0, #0x1b8
    str r0, [sp, #0x4]
    ldr r0, [sp]
    add r0, r0, #0x1b8
    str r0, [sp]
    blt .L_1934
    ldr r0, [sl, #0x30]
    cmp r0, #0x0
    beq .L_1b2c
    ldr r0, [sl, #0x1c]
    add r1, sl, #0x24
    add r2, sl, #0x30
    bl func_0201ef3c
    mov r0, #0x0
    str r0, [sl, #0x34]
    str r0, [sl, #0x30]
.L_1b2c:
    mov r0, #0x1
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
