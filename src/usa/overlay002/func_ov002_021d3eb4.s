; func_ov002_021d3eb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce870
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0b8
        .extern data_ov002_022d008c
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021d3eb4
        .arm
func_ov002_021d3eb4:
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
    beq .L_b4c
    cmp r1, #0x1
    beq .L_b90
    ldmia sp!, {r3, r4, r5, pc}
.L_b4c:
    cmp r4, #0xb
    beq .L_b68
    mov r1, r5
    mov r2, r4
    mov r0, #0x30
    mov r3, #0x0
    bl func_ov002_0229acd0
.L_b68:
    mov r2, #0x0
    mov r1, r5
    mov r3, r2
    mov r0, #0xd
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, pc}
.L_b90:
    cmp r4, #0xb
    beq .L_ba8
    mov r0, #0x30
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_ba8:
    ldr r0, _LIT1
    and r2, r5, #0x1
    rsb r1, r5, #0x1
    and r1, r1, #0x1
    mul r3, r2, r0
    mul r2, r1, r0
    ldr r1, _LIT2
    mov ip, #0x0
    str ip, [r1, r3]
    ldr r0, _LIT3
    ldr r1, _LIT4
    str r4, [r0, r2]
    mov r2, #0x1
    str r2, [r1, #0xe0]
    ldr r0, _LIT5
    ldr r1, _LIT4
    ldr r0, [r0, #0x4]
    cmp r5, r0
    moveq r2, #0x2
    str r2, [r1, #0xd00]
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf0b8
_LIT4: .word data_ov002_022d008c
_LIT5: .word data_ov002_022cd65c
