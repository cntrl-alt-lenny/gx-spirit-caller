; func_ov004_021caf80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b2a0
        .extern func_02005c84
        .extern func_02005e04
        .extern func_0201d3ac
        .extern func_0208c79c
        .extern func_0208e230
        .extern func_ov004_021cb904
        .extern func_ov004_021cd9ac
        .extern func_ov004_021cdc3c
        .extern func_ov004_021ce3c8
        .extern func_ov004_021cf558
        .extern func_ov004_021cfaa4
        .extern func_ov004_021d05cc
        .extern func_ov004_021d2440
        .extern func_ov004_021d2de4
        .extern func_ov004_021d32b0
        .extern func_ov004_021d3498
        .extern func_ov004_021d3738
        .global func_ov004_021caf80
        .arm
func_ov004_021caf80:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x60]
    ldr r1, [r0, #0x48]
    ldr r0, [r0, #0x4c]
    ldr r4, _LIT1
    cmp r1, r0
    ldr r0, [r4, #0x5c]
    beq .L_104
    add r0, r0, #0x1
    str r0, [r4, #0x5c]
    cmp r0, #0x10
    ble .L_110
    ldr r0, [r4, #0x4c]
    mov r1, #0x10
    str r1, [r4, #0x5c]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_84
    b .L_68
    b .L_70
    b .L_84
    b .L_78
    b .L_80
.L_68:
    bl func_ov004_021cdc3c
    b .L_84
.L_70:
    bl func_ov004_021cfaa4
    b .L_84
.L_78:
    bl func_ov004_021d2440
    b .L_84
.L_80:
    bl func_ov004_021d3738
.L_84:
    ldr r0, [r4, #0x48]
    str r0, [r4, #0x4c]
    cmp r0, #0xb
    addls pc, pc, r0, lsl #0x2
    b .L_110
    b .L_c8
    b .L_d0
    b .L_110
    b .L_d8
    b .L_e0
    b .L_e8
    b .L_e8
    b .L_e8
    b .L_e8
    b .L_110
    b .L_110
    b .L_f4
.L_c8:
    bl func_ov004_021cb904
    b .L_110
.L_d0:
    bl func_ov004_021ce3c8
    b .L_110
.L_d8:
    bl func_ov004_021d05cc
    b .L_110
.L_e0:
    bl func_ov004_021d32b0
    b .L_110
.L_e8:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, pc}
.L_f4:
    bl func_0201d3ac
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, pc}
.L_104:
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r4, #0x5c]
.L_110:
    ldr r0, [r4, #0x4c]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_190
    b .L_134
    b .L_14c
    b .L_190
    b .L_164
    b .L_17c
.L_134:
    bl func_ov004_021cd9ac
    cmp r0, #0x0
    beq .L_190
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, pc}
.L_14c:
    bl func_ov004_021cf558
    cmp r0, #0x0
    beq .L_190
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, pc}
.L_164:
    bl func_ov004_021d2de4
    cmp r0, #0x0
    beq .L_190
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, pc}
.L_17c:
    bl func_ov004_021d3498
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r3, r4, pc}
.L_190:
    ldr r1, [r4]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4]
    bl func_02005e04
    mov r0, #0x2
    bl func_02005e04
    mov r0, #0x1
    bl func_02005c84
    mov r0, #0x2
    bl func_02005c84
    mov r0, #0x0
    str r0, [sp]
    ldr r0, _LIT2
    mov r1, #0x1
    mov r2, #0x3f
    mov r3, #0x10
    bl func_0208e230
    ldr r0, _LIT3
    ldr r1, [r4, #0x5c]
    rsb r1, r1, #0x0
    bl func_0208c79c
    ldr r1, [r4, #0x5c]
    ldr r0, _LIT4
    rsb r1, r1, #0x0
    bl func_0208c79c
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_ov004_0220b2a0
_LIT2: .word 0x04000050
_LIT3: .word 0x0400006c
_LIT4: .word 0x0400106c
