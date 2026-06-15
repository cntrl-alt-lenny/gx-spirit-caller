; func_ov008_021b22e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020f84e0
        .extern data_ov008_021b270c
        .extern func_020211c8
        .extern func_020212cc
        .extern func_0202147c
        .extern func_0202227c
        .extern func_0202c948
        .extern func_0202c9c0
        .extern func_ov008_021b2268
        .global func_ov008_021b22e4
        .arm
func_ov008_021b22e4:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r3, [r1]
    ldr r2, [r3, #0x6c]
    cmp r2, r0
    ldmeqia sp!, {r3, pc}
    str r0, [r3, #0x6c]
    ldr r1, [r1]
    ldr r0, [r1, #0x6c]
    cmp r0, #0x0
    ldr r0, [r1, #0x4]
    beq .L_90
    cmp r0, #0x0
    bne .L_6c
    ldr r0, _LIT1
    bl func_020211c8
    ldr r1, _LIT0
    ldr r2, [r1]
    str r0, [r2, #0x4]
    ldr r0, [r1]
    ldr r0, [r0, #0x4]
    bl func_0202147c
    ldr r0, _LIT0
    mov r1, #0x1
    ldr r0, [r0]
    ldr r0, [r0, #0xc]
    bl func_ov008_021b2268
.L_6c:
    ldr r1, _LIT0
    mov r0, #0x29
    ldr r1, [r1]
    add r1, r1, #0x70
    bl func_0202227c
    mov r0, #0x1
    mov r1, #0x2
    bl func_0202c948
    b .L_ac
.L_90:
    cmp r0, #0x0
    beq .L_ac
    bl func_020212cc
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x4]
.L_ac:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x6c]
    bl func_0202c9c0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov008_021b270c
_LIT1: .word data_020f84e0
