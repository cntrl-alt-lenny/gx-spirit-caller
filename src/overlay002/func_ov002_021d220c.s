; func_ov002_021d220c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022cf288
        .extern func_ov002_021c9b2c
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d220c
        .arm
func_ov002_021d220c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r5, #0x1
    ldr r1, [r0, #0x810]
    moveq r5, #0x0
    ldrh r4, [r0, #0x2]
    cmp r1, #0x0
    beq .L_38
    cmp r1, #0x1
    beq .L_94
    ldmia sp!, {r3, r4, r5, pc}
.L_38:
    mov r0, r5
    mov r2, r4
    mov r1, #0x1
    bl func_ov002_021c9b2c
    mov r1, r5
    mov r2, r4
    mov r0, #0x12
    mov r3, #0x0
    bl func_ov002_0229ade0
    cmp r4, #0x0
    beq .L_80
    ldr r0, _LIT1
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r1, _LIT2
    ldr r0, [r1, r2]
    orr r0, r0, #0x4
    str r0, [r1, r2]
.L_80:
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, pc}
.L_94:
    mov r0, #0x12
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf288
