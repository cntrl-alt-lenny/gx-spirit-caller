; func_ov004_021d2b60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov004_0220b2a0
        .extern data_ov004_02291388
        .extern func_0201cb84
        .extern func_0201ccc8
        .extern func_0201cf8c
        .extern func_0202bfd4
        .extern func_0202c06c
        .extern func_020371b8
        .extern func_02091554
        .extern func_ov004_021cfb0c
        .extern func_ov004_021d0088
        .extern func_ov004_021d0eb8
        .extern func_ov004_021d1228
        .extern func_ov004_021d86ac
        .global func_ov004_021d2b60
        .arm
func_ov004_021d2b60:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x280
    add r1, sp, #0x80
    mov r0, #0x6
    ldr r5, _LIT0
    bl func_0201cb84
    cmp r0, #0x0
    addeq sp, sp, #0x280
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [sp, #0x80]
    sub r0, r0, #0xa
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_260
    b .L_58
    b .L_6c
    b .L_8c
    b .L_260
    b .L_f8
    b .L_134
    b .L_23c
.L_58:
    mov r1, #0x1
    mov r0, #0x4
    str r1, [r5, #0x48]
    str r0, [r5, #0x54]
    b .L_260
.L_6c:
    add r0, r5, #0x3000
    mov r1, #0x0
    mov r2, #0x1
    str r2, [r0, #0xc7c]
    str r1, [r0, #0xc10]
    str r1, [r0, #0xc6c]
    str r1, [r0, #0xc70]
    b .L_260
.L_8c:
    ldrh r0, [sp, #0x82]
    add r7, r5, #0x3000
    mov r6, #0x0
    str r6, [r7, #0xc7c]
    str r0, [r7, #0xc10]
    str r6, [r7, #0xc68]
    str r0, [r7, #0xc0c]
    str r6, [r7, #0xc64]
    cmp r0, #0x0
    ble .L_ec
    add r4, sp, #0x80
.L_b8:
    add r0, r4, r6, lsl #0x1
    ldrh r1, [r0, #0x4]
    add r0, r5, r6, lsl #0x2
    add r0, r0, #0x3000
    str r1, [r0, #0xc3c]
    str r1, [r0, #0xc14]
    ldr r1, [r0, #0xc3c]
    add r0, r6, #0xa
    bl func_ov004_021cfb0c
    ldr r0, [r7, #0xc10]
    add r6, r6, #0x1
    cmp r6, r0
    blt .L_b8
.L_ec:
    mov r0, #0x11
    str r0, [r5, #0x54]
    b .L_260
.L_f8:
    ldrh r6, [sp, #0x82]
    mov r0, #0x3a
    add r4, r5, #0x3000
    mov r3, #0x1
    sub r1, r0, #0x3b
    mov r2, #0x0
    str r6, [r4, #0xc64]
    str r3, [r4, #0xc70]
    bl func_020371b8
    mov r0, r4
    ldr r1, [r0, #0xc64]
    str r1, [r0, #0xc80]
    str r1, [r0, #0xc68]
    bl func_ov004_021d1228
    b .L_260
.L_134:
    ldrh r0, [sp, #0x82]
    cmp r0, #0x0
    beq .L_210
    add r0, r5, #0x3000
    ldr r0, [r0, #0xc68]
    add r0, r5, r0, lsl #0x2
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc3c]
    bl func_0202bfd4
    add r1, r5, #0x3000
    ldr r1, [r1, #0xc68]
    rsb r2, r0, r0, lsl #0x3
    add r0, r5, r1, lsl #0x2
    add r0, r0, #0x3000
    ldr r3, _LIT1
    ldr r0, [r0, #0xc3c]
    mov r1, r2, lsr #0x1f
    smull r2, r4, r3, r2
    add r4, r1, r4, asr #0x2
    bl func_ov004_021d0088
    ldr r0, _LIT2
    ldr r0, [r0, #0xa60]
    cmp r4, r0
    bhi .L_1c0
    ldr r0, _LIT3
    bl func_0202c06c
    mov r1, r0
    add r0, sp, #0x0
    mov r2, r4
    bl func_02091554
    ldr r0, _LIT4
    add r1, sp, #0x0
    mov r2, #0x4
    bl func_ov004_021d86ac
    b .L_1e8
.L_1c0:
    ldr r0, _LIT5
    bl func_0202c06c
    mov r1, r0
    add r0, sp, #0x0
    mov r2, r4
    bl func_02091554
    ldr r0, _LIT4
    add r1, sp, #0x0
    mov r2, #0x2
    bl func_ov004_021d86ac
.L_1e8:
    mov r0, #0x3a
    add r4, r5, #0x3000
    mov r3, #0x1
    sub r1, r0, #0x3b
    mov r2, #0x0
    str r3, [r4, #0xc78]
    bl func_020371b8
    mov r0, #0xf
    str r0, [r5, #0x54]
    b .L_260
.L_210:
    ldr r0, [r5, #0x54]
    cmp r0, #0xf
    bne .L_224
    mov r0, #0x0
    bl func_ov004_021d0eb8
.L_224:
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_260
.L_23c:
    bl func_0201cf8c
    cmp r0, #0x0
    bne .L_258
    add r1, sp, #0x80
    mov r0, #0x6
    mov r2, #0x2
    bl func_0201ccc8
.L_258:
    mov r0, #0x1
    bl func_ov004_021d0eb8
.L_260:
    mov r0, #0x1
    add sp, sp, #0x280
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word 0x66666667
_LIT2: .word data_02104e6c
_LIT3: .word 0x000001c1
_LIT4: .word data_ov004_02291388
_LIT5: .word 0x000001c2
