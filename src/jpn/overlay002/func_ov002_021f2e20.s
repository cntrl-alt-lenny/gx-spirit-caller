; func_ov002_021f2e20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021b9d20
        .extern func_ov002_021b9d68
        .extern func_ov002_021b9db0
        .extern func_ov002_021b9dc4
        .extern func_ov002_021b9dd8
        .extern func_ov002_021c1d64
        .global func_ov002_021f2e20
        .arm
func_ov002_021f2e20:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r3, _LIT0
    and lr, r5, #0x1
    mul r3, lr, r3
    ldr lr, _LIT1
    mov r4, r2
    mov ip, #0x14
    mul ip, r4, ip
    add lr, lr, r3
    add lr, lr, ip
    ldr lr, [lr, #0x30]
    mov lr, lr, lsl #0x13
    movs lr, lr, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr lr, _LIT2
    add r3, lr, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9d20
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9d68
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9db0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9dc4
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9dd8
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
