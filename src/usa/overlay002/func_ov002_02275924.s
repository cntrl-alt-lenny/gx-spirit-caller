; func_ov002_02275924 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cf08c
        .extern func_ov002_021b8eec
        .extern func_ov002_021c22cc
        .global func_ov002_02275924
        .arm
func_ov002_02275924:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    mov r5, r0
    ldr r3, [r3]
    add r4, r1, r2
    mov r1, r3, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    cmp r4, #0xa
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    ldr r2, _LIT2
    and r3, r5, #0x1
    mla r2, r3, r1, r2
    mov r1, #0x14
    mla r1, r4, r1, r2
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r4, #0x5
    bge .L_1ef4
    mov r1, r4
    bl func_ov002_021b8eec
    cmp r0, #0x0
    beq .L_1f0c
.L_1ef4:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c22cc
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r3, r4, r5, pc}
.L_1f0c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
