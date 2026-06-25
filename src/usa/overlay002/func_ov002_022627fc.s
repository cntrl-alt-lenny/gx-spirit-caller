; func_ov002_022627fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf098
        .extern func_ov002_021b3dec
        .extern func_ov002_021bad9c
        .extern func_ov002_021bbe70
        .extern func_ov002_021bce20
        .extern func_ov002_021c3a04
        .global func_ov002_022627fc
        .arm
func_ov002_022627fc:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r1, #0xb
    mov r4, r0
    bl func_ov002_021b3dec
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r2]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_ov002_021bbe70
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_ov002_021bce20
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    rsb r4, r4, #0x1
    ldr r1, _LIT0
    mov r0, r4
    bl func_ov002_021c3a04
    cmp r0, #0x0
    bne .L_1d4
    ldr r1, _LIT0
    mov r0, r4
    sub r2, r1, #0x1500
    bl func_ov002_021bad9c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_1d4:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000014ff
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
