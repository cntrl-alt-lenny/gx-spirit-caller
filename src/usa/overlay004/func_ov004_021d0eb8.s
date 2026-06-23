; func_ov004_021d0eb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov004_0220b2a0
        .extern data_ov004_02291388
        .extern func_0200886c
        .extern func_0202ba40
        .extern func_0202bbd0
        .extern func_0202bfd4
        .extern func_0202c06c
        .extern func_ov004_021cfb0c
        .extern func_ov004_021d0088
        .extern func_ov004_021d86ac
        .global func_ov004_021d0eb8
        .arm
func_ov004_021d0eb8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    cmp r0, #0x0
    ldr r4, _LIT0
    beq .L_13c
    add r0, r4, #0x3000
    ldr r0, [r0, #0xc68]
    add r0, r4, r0, lsl #0x2
    add r0, r0, #0x3000
    ldr r5, [r0, #0xc3c]
    mov r0, r5
    bl func_0202bfd4
    rsb r1, r0, r0, lsl #0x3
    ldr r2, _LIT1
    mov r0, r1, lsr #0x1f
    smull r1, r6, r2, r1
    ldr r3, _LIT2
    add r6, r0, r6, asr #0x2
    ldr r1, [r3, #0xa60]
    mov r0, r5
    sub r2, r1, r6
    mov r1, #0x1
    str r2, [r3, #0xa60]
    bl func_0202ba40
    mov r0, r5
    mov r1, #0x1
    bl func_0202bbd0
    mov r0, #0xe8
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT3
    mov r2, #0x1
    bl func_ov004_021d86ac
    bl func_0200886c
    mov r0, #0x0
    bl func_ov004_021d0088
    ldr r0, _LIT4
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT3
    mov r2, #0x1
    bl func_ov004_021d86ac
    add r0, r4, #0x3000
    ldr r2, [r0, #0xc0c]
    ldr r1, [r0, #0xc10]
    sub r2, r2, #0x1
    sub r1, r1, #0x1
    mov r5, #0x0
    str r2, [r0, #0xc0c]
    str r1, [r0, #0xc10]
    mov r7, r4
    mov r8, r5
.L_cc:
    add r2, r4, r5, lsl #0x2
    add r0, r2, #0x3000
    ldr r6, [r0, #0xc64]
    ldr r1, [r0, #0xc0c]
    add r0, r2, #0xc
    cmp r6, r1
    add r9, r0, #0x3c00
    bge .L_11c
.L_ec:
    add r2, r7, r6, lsl #0x2
    add r0, r2, #0x14
    add r0, r0, #0x3c00
    ldr r1, [r0, #0x4]
    add r0, r2, #0x3000
    str r1, [r0, #0xc14]
    add r0, r6, r8
    bl func_ov004_021cfb0c
    ldr r0, [r9]
    add r6, r6, #0x1
    cmp r6, r0
    blt .L_ec
.L_11c:
    add r5, r5, #0x1
    cmp r5, #0x2
    add r7, r7, #0x28
    add r8, r8, #0xa
    blt .L_cc
    mov r0, #0xe
    str r0, [r4, #0x54]
    b .L_148
.L_13c:
    ldr r0, [r4, #0x54]
    sub r0, r0, #0x1
    str r0, [r4, #0x54]
.L_148:
    add r0, r4, #0x3000
    mov r1, #0x0
    str r1, [r0, #0xc6c]
    str r1, [r0, #0xc70]
    str r1, [r0, #0xc74]
    str r1, [r0, #0xc78]
    str r1, [r0, #0xc64]
    str r1, [r0, #0xc68]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word 0x66666667
_LIT2: .word data_02104e6c
_LIT3: .word data_ov004_02291388
_LIT4: .word 0x00000101
