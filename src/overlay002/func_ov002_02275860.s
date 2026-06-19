; func_ov002_02275860 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_0202b878
        .extern func_ov002_021b8fcc
        .extern func_ov002_021c23ac
        .global func_ov002_02275860
        .arm
func_ov002_02275860:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    mov r5, r0
    ldr r0, [r3]
    add r4, r1, r2
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    cmp r4, #0xa
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    and r2, r5, #0x1
    mul r3, r2, r1
    mov r0, #0x14
    mul r2, r4, r0
    ldr r1, _LIT2
    add r0, r1, r3
    add r0, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT3
    add r1, r1, r3
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_0202b878
    cmp r0, #0x17
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    cmp r4, #0x5
    bge .L_1d74
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    beq .L_1d8c
.L_1d74:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c23ac
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r3, r4, r5, pc}
.L_1d8c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf1a4
