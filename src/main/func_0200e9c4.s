; func_0200e9c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02186ae8
        .extern data_02186b00
        .extern func_0200ac60
        .extern func_0200c874
        .extern func_0200cb50
        .extern func_02011098
        .extern func_02011178
        .extern func_020111e4
        .extern func_020115a8
        .extern func_020115e0
        .extern func_02011620
        .extern func_02011688
        .extern func_020116ec
        .extern func_0208b32c
        .global func_0200e9c4
        .arm
func_0200e9c4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xf0
    mov r0, #0x0
    bl func_02011098
    bl func_0200ac60
    ldr r0, _LIT0
    mov sl, #0x0
    strh sl, [r0, #0x2]
.L_1a5c:
    mov r0, sl
    bl func_02011098
    mov r4, r0
    ldr r1, [r4, #0xa8]
    cmp r1, #0x0
    beq .L_1da0
    ldr r1, [r4, #0xb0]
    cmp r1, #0x0
    beq .L_1a84
    blx r1
.L_1a84:
    ldr r3, _LIT1
    mov r0, #0x3
    str r0, [r3]
    mov r2, #0x0
    str r2, [r3, #0x14]
    mov r2, #0x2
    add r1, sp, #0x30
    mov r0, r4
    str r2, [r3]
    bl func_02011178
    add r1, sp, #0x0
    add r0, r4, #0x30
    bl func_02011178
    ldr fp, _LIT0
    mov r7, #0x0
    ldr r0, [fp, #0xc]
    cmp r0, #0x0
    ble .L_1da0
    mov r9, r7
    add r4, sp, #0x60
    add r6, sp, #0xc0
    add r5, sp, #0x90
.L_1adc:
    ldr r0, [fp, #0x14]
    add r8, r0, r9
    ldr r0, [r8, #0x7c]
    mov r0, r0, lsl #0x7
    cmp sl, r0, lsr #0x1c
    bne .L_1d8c
    ldr r0, [r8, #0x27c]
    cmp r0, #0x0
    beq .L_1b10
    ldr r0, [r0, #0x60]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_1d8c
.L_1b10:
    ldr r1, [r8, #0x60]
    mov r0, r1, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_1d8c
    mov r0, r1, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_1d8c
    mov r0, r1, lsl #0x1d
    movs r0, r0, lsr #0x1f
    beq .L_1d8c
    add r0, sp, #0x30
    mov r1, r6
    bl func_02011178
    add r0, sp, #0x0
    mov r1, r5
    bl func_02011178
    ldr r1, [r8, #0x34]
    cmp r1, #0x0
    ldreq r0, [r8, #0x38]
    cmpeq r0, #0x0
    ldreq r0, [r8, #0x3c]
    cmpeq r0, #0x0
    beq .L_1b8c
    mov r0, r4
    ldr r2, [r8, #0x38]
    ldr r3, [r8, #0x3c]
    bl func_020115e0
    mov r0, r6
    mov r1, r4
    mov r2, r6
    bl func_020111e4
.L_1b8c:
    ldr r0, [r8, #0x7c]
    mov r0, r0, lsl #0x6
    movs r0, r0, lsr #0x1f
    beq .L_1bac
    ldr r0, _LIT2
    mov r1, r6
    mov r2, r6
    bl func_0208b32c
.L_1bac:
    ldr r0, [r8, #0x60]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x1f
    beq .L_1c5c
    ldrh r1, [r8, #0x40]
    cmp r1, #0x0
    beq .L_1bf0
    mov r0, r4
    bl func_02011620
    mov r0, r6
    mov r1, r4
    mov r2, r6
    bl func_020111e4
    mov r0, r5
    mov r1, r4
    mov r2, r5
    bl func_020111e4
.L_1bf0:
    ldrh r1, [r8, #0x42]
    cmp r1, #0x0
    beq .L_1c24
    mov r0, r4
    bl func_02011688
    mov r0, r6
    mov r1, r4
    mov r2, r6
    bl func_020111e4
    mov r0, r5
    mov r1, r4
    mov r2, r5
    bl func_020111e4
.L_1c24:
    ldrh r1, [r8, #0x44]
    cmp r1, #0x0
    beq .L_1cf8
    mov r0, r4
    bl func_020116ec
    mov r0, r6
    mov r1, r4
    mov r2, r6
    bl func_020111e4
    mov r0, r5
    mov r1, r4
    mov r2, r5
    bl func_020111e4
    b .L_1cf8
.L_1c5c:
    ldrh r1, [r8, #0x44]
    cmp r1, #0x0
    beq .L_1c90
    mov r0, r4
    bl func_020116ec
    mov r0, r6
    mov r1, r4
    mov r2, r6
    bl func_020111e4
    mov r0, r5
    mov r1, r4
    mov r2, r5
    bl func_020111e4
.L_1c90:
    ldrh r1, [r8, #0x42]
    cmp r1, #0x0
    beq .L_1cc4
    mov r0, r4
    bl func_02011688
    mov r0, r6
    mov r1, r4
    mov r2, r6
    bl func_020111e4
    mov r0, r5
    mov r1, r4
    mov r2, r5
    bl func_020111e4
.L_1cc4:
    ldrh r1, [r8, #0x40]
    cmp r1, #0x0
    beq .L_1cf8
    mov r0, r4
    bl func_02011620
    mov r0, r6
    mov r1, r4
    mov r2, r6
    bl func_020111e4
    mov r0, r5
    mov r1, r4
    mov r2, r5
    bl func_020111e4
.L_1cf8:
    ldr r1, [r8, #0x48]
    cmp r1, #0x1000
    ldreq r0, [r8, #0x4c]
    cmpeq r0, #0x1000
    ldreq r0, [r8, #0x50]
    cmpeq r0, #0x1000
    beq .L_1d34
    mov r0, r4
    ldr r2, [r8, #0x4c]
    ldr r3, [r8, #0x50]
    bl func_020115a8
    mov r0, r6
    mov r1, r4
    mov r2, r6
    bl func_020111e4
.L_1d34:
    ldr r0, [r8, #0x80]
    cmp r0, #0x0
    beq .L_1d68
    ldr r0, [r8, #0x84]
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq .L_1d7c
    mov r0, r8
    mov r1, #0x0
    mov r2, r6
    mov r3, r5
    bl func_0200cb50
    b .L_1d7c
.L_1d68:
    mov r0, r8
    mov r1, #0x0
    mov r2, r6
    mov r3, r5
    bl func_0200c874
.L_1d7c:
    ldr r2, [r8, #0x54]
    mov r0, r8
    mov r1, #0x0
    blx r2
.L_1d8c:
    ldr r0, [fp, #0xc]
    add r9, r9, #0x284
    add r7, r7, #0x1
    cmp r7, r0
    blt .L_1adc
.L_1da0:
    add sl, sl, #0x1
    cmp sl, #0x2
    blt .L_1a5c
    add sp, sp, #0xf0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02186ae8
_LIT1: .word 0x04000440
_LIT2: .word data_02186b00
