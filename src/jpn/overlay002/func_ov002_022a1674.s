; func_ov002_022a1674 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d19bc
        .extern func_02006110
        .extern func_02006160
        .extern func_02006178
        .extern func_ov002_022a1760
        .extern func_ov002_022a1780
        .extern func_ov002_022ae44c
        .global func_ov002_022a1674
        .arm
func_ov002_022a1674:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0xd4]
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    cmp r0, #0x0
    bne .L_d4
    bl func_02006178
    cmp r0, #0x0
    bne .L_54
    bl func_02006160
    cmp r0, #0x0
    beq .L_bc
.L_54:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022a1780
    cmp r0, #0x0
    bne .L_bc
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    ldr r0, _LIT1
    bl func_ov002_022ae44c
    cmp r0, #0x0
    bge .L_bc
    mov r0, r4
    bl func_ov002_022a1760
    cmp r0, #0x0
    bne .L_b0
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_022a1780
    cmp r0, #0x0
    beq .L_bc
.L_b0:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_bc:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x52]
    tst r0, #0x300
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
.L_d4:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d0e4c
_LIT1: .word data_ov002_022d19bc
_LIT2: .word data_02104acc
