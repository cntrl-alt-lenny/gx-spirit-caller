; func_ov002_0229968c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd524
        .extern data_ov002_022cf288
        .extern data_ov002_022d016c
        .extern func_ov002_021c9c94
        .extern func_ov002_021c9e14
        .extern func_ov002_0227c630
        .extern func_ov002_022864d0
        .extern func_ov002_02298dcc
        .global func_ov002_0229968c
        .arm
func_ov002_0229968c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0x8]
    ldr r4, [r1, #0xcec]
    cmp r0, #0x0
    bne .L_ce8
    mov r0, r4
    bl func_ov002_0227c630
    cmp r0, #0x0
    beq .L_c64
    ldr r0, _LIT2
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT3
    ldr r0, [r0, r2]
    mov r0, r0, lsr #0x11
    tst r0, #0x1
    bne .L_c64
    mov r0, r4
    bl func_ov002_021c9e14
    cmp r0, #0x0
    bne .L_c80
    mov r0, r4
    bl func_ov002_021c9c94
    cmp r0, #0x0
    bne .L_c80
.L_c64:
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0x8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x8]
    ldmia sp!, {r3, r4, pc}
.L_c80:
    add r1, sp, #0x0
    mov r0, r4
    bl func_ov002_022864d0
    mov r1, r0
    mvn r0, #0x0
    cmp r1, r0
    ble .L_ccc
    ldr r2, [sp]
    mov r0, r4
    bl func_ov002_02298dcc
    cmp r0, #0x0
    beq .L_cc0
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
.L_cc0:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, pc}
.L_ccc:
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0x8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x8]
    ldmia sp!, {r3, r4, pc}
.L_ce8:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022cd524
_LIT1: .word data_ov002_022d016c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf288
