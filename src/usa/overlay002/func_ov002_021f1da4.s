; func_ov002_021f1da4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_0202b8fc
        .extern func_ov002_021c1d64
        .extern func_ov002_021c1fa4
        .extern func_ov002_021c8390
        .global func_ov002_021f1da4
        .arm
func_ov002_021f1da4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    ldrh r3, [r9, #0x2]
    mov r8, r1
    mov r7, r2
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    rsb r3, r3, #0x1
    cmp r8, r3
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r7, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r3, _LIT0
    and r4, r8, #0x1
    mul r6, r4, r3
    mov r3, #0x14
    mul r5, r7, r3
    ldr r4, _LIT1
    add r3, r4, r6
    add r4, r3, #0x30
    ldr r3, [r4, r5]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r3, #0x0
    bl func_ov002_021c1fa4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r1, [r9]
    ldr r0, _LIT2
    cmp r1, r0
    beq .L_bc
    ldr r0, _LIT3
    cmp r1, r0
    beq .L_dc
    b .L_134
.L_bc:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8390
    ldr r1, _LIT4
    cmp r0, r1
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_dc:
    ldr r0, _LIT5
    add r0, r0, r6
    ldrh r0, [r5, r0]
    cmp r0, #0x0
    beq .L_110
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8390
    ldr r1, _LIT4
    cmp r0, r1
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_110:
    ldr r0, [r4, r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8fc
    ldr r1, _LIT4
    cmp r0, r1
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_134:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x0000123b
_LIT3: .word 0x0000188c
_LIT4: .word 0x000005dc
_LIT5: .word data_ov002_022cf0c4
