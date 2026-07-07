; func_ov002_021d2058 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern data_ov002_022cf1a8
        .extern func_ov002_021b99c8
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021d2058
        .arm
func_ov002_021d2058:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r1, _LIT0
    ldrh r0, [r0]
    ldrh r1, [r1, #0x2]
    tst r0, #0x8000
    movne r4, #0x1
    moveq r4, #0x0
    mov r0, r4
    bl func_ov002_021b99c8
    ldr r1, _LIT0
    mov r2, r0
    ldr r0, [r1, #0x810]
    cmp r0, #0x0
    beq .L_50
    cmp r0, #0x1
    beq .L_5c
    cmp r0, #0x2
    beq .L_a4
    ldmia sp!, {r4, pc}
.L_50:
    add r0, r0, #0x1
    str r0, [r1, #0x810]
    ldmia sp!, {r4, pc}
.L_5c:
    cmp r2, #0x0
    blt .L_90
    mov r1, r4
    mov r0, #0x11
    mov r3, #0x0
    bl func_ov002_0229acd0
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r1, _LIT2
    ldr r0, [r1, r2]
    orr r0, r0, #0x4
    str r0, [r1, r2]
.L_90:
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, pc}
.L_a4:
    mov r0, #0x11
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a8
