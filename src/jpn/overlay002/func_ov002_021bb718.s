; func_ov002_021bb718 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202e1e0
        .extern func_ov002_021b9dec
        .extern func_ov002_021ba024
        .global func_ov002_021bb718
        .arm
func_ov002_021bb718:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r1
    mov r6, r0
    mov r0, r5
    mov r4, r2
    mov r8, #0x0
    bl func_0202e1e0
    cmp r0, #0x0
    ldr r0, _LIT0
    beq .L_9c
    ldr r2, _LIT1
    and r1, r6, #0x1
    mla r9, r1, r0, r2
    mov r7, r8
.L_38:
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9dec
    cmp r0, #0x0
    ble .L_88
    cmp r7, r4
    beq .L_88
    mov r0, r6
    mov r1, r7
    mov r2, r5
    bl func_ov002_021ba024
    cmp r0, #0x0
    ldrneh r0, [r9, #0x38]
    cmpne r0, #0x0
    beq .L_88
    ldr r1, [r9, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    addeq r8, r8, #0x1
.L_88:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r9, r9, #0x14
    blt .L_38
    b .L_104
.L_9c:
    ldr r2, _LIT1
    and r1, r6, #0x1
    mla r0, r1, r0, r2
    add r7, r0, #0x64
    mov r9, #0x5
.L_b0:
    mov r0, r6
    mov r1, r9
    bl func_ov002_021b9dec
    cmp r0, #0x0
    ble .L_f4
    cmp r9, r4
    beq .L_f4
    cmp r0, r5
    bne .L_f4
    ldrh r0, [r7, #0x38]
    cmp r0, #0x0
    beq .L_f4
    ldr r1, [r7, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    addeq r8, r8, #0x1
.L_f4:
    add r9, r9, #0x1
    cmp r9, #0xa
    add r7, r7, #0x14
    ble .L_b0
.L_104:
    mov r0, r8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
