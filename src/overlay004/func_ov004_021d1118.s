; func_ov004_021d1118 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern func_02008888
        .extern func_0202ba94
        .extern func_0202bae4
        .extern func_ov004_021cfbec
        .extern func_ov004_021d0530
        .extern func_ov004_021d05f4
        .extern func_ov004_021d0e98
        .global func_ov004_021d1118
        .arm
func_ov004_021d1118:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    cmp r0, #0x0
    ldr r4, _LIT0
    beq .L_e14
    add r0, r4, #0x3000
    ldr r1, [r0, #0xc68]
    ldr r0, [r0, #0xc64]
    add r2, r4, r1, lsl #0x2
    add r1, r4, r0, lsl #0x2
    add r0, r2, #0x3000
    add r1, r1, #0x3000
    ldr r5, [r0, #0xc3c]
    ldr r0, [r1, #0xc14]
    mov r1, #0x1
    bl func_0202bae4
    mov r0, r5
    mov r1, #0x1
    bl func_0202ba94
    mov r0, #0xe8
    bl func_ov004_021d0530
    bl func_02008888
    mov r0, #0x0
    bl func_ov004_021d0530
    add r0, r4, #0x3000
    ldr r2, [r0, #0xc0c]
    ldr r1, [r0, #0xc10]
    sub r2, r2, #0x1
    sub r1, r1, #0x1
    mov r5, #0x0
    mov r7, r4
    mov r8, r5
    str r2, [r0, #0xc0c]
    str r1, [r0, #0xc10]
.L_db0:
    add r2, r4, r5, lsl #0x2
    add r0, r2, #0x3000
    ldr r6, [r0, #0xc64]
    ldr r1, [r0, #0xc0c]
    add r0, r2, #0xc
    cmp r6, r1
    add r9, r0, #0x3c00
    bge .L_e00
.L_dd0:
    add r2, r7, r6, lsl #0x2
    add r0, r2, #0x14
    add r0, r0, #0x3c00
    ldr r1, [r0, #0x4]
    add r0, r2, #0x3000
    str r1, [r0, #0xc14]
    add r0, r6, r8
    bl func_ov004_021cfbec
    ldr r0, [r9]
    add r6, r6, #0x1
    cmp r6, r0
    blt .L_dd0
.L_e00:
    add r5, r5, #0x1
    cmp r5, #0x2
    add r7, r7, #0x28
    add r8, r8, #0xa
    blt .L_db0
.L_e14:
    mov r0, #0x0
    bl func_ov004_021d0e98
    ldr r0, [r4, #0x54]
    add r1, r4, #0x3000
    mov r3, #0x0
    sub r2, r0, #0x1
    mov r0, #0x1
    str r3, [r1, #0xc6c]
    str r3, [r1, #0xc70]
    str r3, [r1, #0xc74]
    str r3, [r1, #0xc78]
    str r3, [r1, #0xc64]
    str r3, [r1, #0xc68]
    str r2, [r4, #0x54]
    bl func_ov004_021d05f4
    add r0, r4, #0x3000
    ldr r0, [r0, #0xc84]
    cmp r0, #0x0
    movne r0, #0x9
    moveq r0, #0xc
    add r0, r0, #0xb6
    add r0, r0, #0x300
    bl func_ov004_021d0530
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov004_0220b500
