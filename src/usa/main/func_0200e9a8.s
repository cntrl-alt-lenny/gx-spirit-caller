; func_0200e9a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02186a08
        .extern data_02186a20
        .extern func_0200ac44
        .extern func_0200c858
        .extern func_0200cb34
        .extern func_0201107c
        .extern func_0201115c
        .extern func_020111c8
        .extern func_0201158c
        .extern func_020115c4
        .extern func_02011604
        .extern func_0201166c
        .extern func_020116d0
        .extern func_0208b244
        .global func_0200e9a8
        .arm
func_0200e9a8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xf0
    mov r0, #0x0
    bl func_0201107c
    bl func_0200ac44
    ldr r0, _LIT0
    mov sl, #0x0
    strh sl, [r0, #0x2]
.L_c20:
    mov r0, sl
    bl func_0201107c
    mov r4, r0
    ldr r1, [r4, #0xa8]
    cmp r1, #0x0
    beq .L_f64
    ldr r1, [r4, #0xb0]
    cmp r1, #0x0
    beq .L_c48
    blx r1
.L_c48:
    ldr r3, _LIT1
    mov r0, #0x3
    str r0, [r3]
    mov r2, #0x0
    str r2, [r3, #0x14]
    mov r2, #0x2
    add r1, sp, #0x30
    mov r0, r4
    str r2, [r3]
    bl func_0201115c
    add r1, sp, #0x0
    add r0, r4, #0x30
    bl func_0201115c
    ldr fp, _LIT0
    mov r7, #0x0
    ldr r0, [fp, #0xc]
    cmp r0, #0x0
    ble .L_f64
    mov r9, r7
    add r4, sp, #0x60
    add r6, sp, #0xc0
    add r5, sp, #0x90
.L_ca0:
    ldr r0, [fp, #0x14]
    add r8, r0, r9
    ldr r0, [r8, #0x7c]
    mov r0, r0, lsl #0x7
    cmp sl, r0, lsr #0x1c
    bne .L_f50
    ldr r0, [r8, #0x27c]
    cmp r0, #0x0
    beq .L_cd4
    ldr r0, [r0, #0x60]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_f50
.L_cd4:
    ldr r1, [r8, #0x60]
    mov r0, r1, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_f50
    mov r0, r1, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_f50
    mov r0, r1, lsl #0x1d
    movs r0, r0, lsr #0x1f
    beq .L_f50
    add r0, sp, #0x30
    mov r1, r6
    bl func_0201115c
    add r0, sp, #0x0
    mov r1, r5
    bl func_0201115c
    ldr r1, [r8, #0x34]
    cmp r1, #0x0
    ldreq r0, [r8, #0x38]
    cmpeq r0, #0x0
    ldreq r0, [r8, #0x3c]
    cmpeq r0, #0x0
    beq .L_d50
    mov r0, r4
    ldr r2, [r8, #0x38]
    ldr r3, [r8, #0x3c]
    bl func_020115c4
    mov r0, r6
    mov r1, r4
    mov r2, r6
    bl func_020111c8
.L_d50:
    ldr r0, [r8, #0x7c]
    mov r0, r0, lsl #0x6
    movs r0, r0, lsr #0x1f
    beq .L_d70
    ldr r0, _LIT2
    mov r1, r6
    mov r2, r6
    bl func_0208b244
.L_d70:
    ldr r0, [r8, #0x60]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x1f
    beq .L_e20
    ldrh r1, [r8, #0x40]
    cmp r1, #0x0
    beq .L_db4
    mov r0, r4
    bl func_02011604
    mov r0, r6
    mov r1, r4
    mov r2, r6
    bl func_020111c8
    mov r0, r5
    mov r1, r4
    mov r2, r5
    bl func_020111c8
.L_db4:
    ldrh r1, [r8, #0x42]
    cmp r1, #0x0
    beq .L_de8
    mov r0, r4
    bl func_0201166c
    mov r0, r6
    mov r1, r4
    mov r2, r6
    bl func_020111c8
    mov r0, r5
    mov r1, r4
    mov r2, r5
    bl func_020111c8
.L_de8:
    ldrh r1, [r8, #0x44]
    cmp r1, #0x0
    beq .L_ebc
    mov r0, r4
    bl func_020116d0
    mov r0, r6
    mov r1, r4
    mov r2, r6
    bl func_020111c8
    mov r0, r5
    mov r1, r4
    mov r2, r5
    bl func_020111c8
    b .L_ebc
.L_e20:
    ldrh r1, [r8, #0x44]
    cmp r1, #0x0
    beq .L_e54
    mov r0, r4
    bl func_020116d0
    mov r0, r6
    mov r1, r4
    mov r2, r6
    bl func_020111c8
    mov r0, r5
    mov r1, r4
    mov r2, r5
    bl func_020111c8
.L_e54:
    ldrh r1, [r8, #0x42]
    cmp r1, #0x0
    beq .L_e88
    mov r0, r4
    bl func_0201166c
    mov r0, r6
    mov r1, r4
    mov r2, r6
    bl func_020111c8
    mov r0, r5
    mov r1, r4
    mov r2, r5
    bl func_020111c8
.L_e88:
    ldrh r1, [r8, #0x40]
    cmp r1, #0x0
    beq .L_ebc
    mov r0, r4
    bl func_02011604
    mov r0, r6
    mov r1, r4
    mov r2, r6
    bl func_020111c8
    mov r0, r5
    mov r1, r4
    mov r2, r5
    bl func_020111c8
.L_ebc:
    ldr r1, [r8, #0x48]
    cmp r1, #0x1000
    ldreq r0, [r8, #0x4c]
    cmpeq r0, #0x1000
    ldreq r0, [r8, #0x50]
    cmpeq r0, #0x1000
    beq .L_ef8
    mov r0, r4
    ldr r2, [r8, #0x4c]
    ldr r3, [r8, #0x50]
    bl func_0201158c
    mov r0, r6
    mov r1, r4
    mov r2, r6
    bl func_020111c8
.L_ef8:
    ldr r0, [r8, #0x80]
    cmp r0, #0x0
    beq .L_f2c
    ldr r0, [r8, #0x84]
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq .L_f40
    mov r0, r8
    mov r1, #0x0
    mov r2, r6
    mov r3, r5
    bl func_0200cb34
    b .L_f40
.L_f2c:
    mov r0, r8
    mov r1, #0x0
    mov r2, r6
    mov r3, r5
    bl func_0200c858
.L_f40:
    ldr r2, [r8, #0x54]
    mov r0, r8
    mov r1, #0x0
    blx r2
.L_f50:
    ldr r0, [fp, #0xc]
    add r9, r9, #0x284
    add r7, r7, #0x1
    cmp r7, r0
    blt .L_ca0
.L_f64:
    add sl, sl, #0x1
    cmp sl, #0x2
    blt .L_c20
    add sp, sp, #0xf0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02186a08
_LIT1: .word 0x04000440
_LIT2: .word data_02186a20
