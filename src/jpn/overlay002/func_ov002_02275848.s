; func_ov002_02275848 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_0202b824
        .extern func_0202b86c
        .extern func_ov002_021c22cc
        .global func_ov002_02275848
        .arm
func_ov002_02275848:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    mov r6, r0
    ldr r0, [r3]
    add r5, r1, r2
    mov r0, r0, lsl #0x1f
    cmp r6, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r5, #0x5
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    cmp r5, #0xa
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT1
    and r2, r6, #0x1
    mul r3, r2, r1
    mov r0, #0x14
    mul r2, r5, r0
    ldr r1, _LIT2
    add r0, r1, r3
    add r0, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r4, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT3
    add r0, r0, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl func_0202b86c
    cmp r0, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl func_0202b824
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    bl func_ov002_021c22cc
    cmp r0, #0x0
    movne r0, #0x800
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf0c4
