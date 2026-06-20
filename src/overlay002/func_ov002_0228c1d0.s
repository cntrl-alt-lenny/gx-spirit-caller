; func_ov002_0228c1d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c8610
        .extern data_ov002_022c863e
        .extern data_ov002_022c89a0
        .extern data_ov002_022cd524
        .extern data_ov002_022ce288
        .extern func_ov002_02288aa0
        .extern func_ov002_02289dfc
        .extern func_ov002_0228bcd0
        .extern func_ov002_02297d08
        .global func_ov002_0228c1d0
        .arm
func_ov002_0228c1d0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r2, _LIT0
    mov r6, r0
    ldr r0, _LIT1
    str r6, [r2]
    ldr r2, [r0, #0x5d4]
    mov r5, r1
    cmp r2, #0x0
    beq .L_5e0
    ldrb r0, [r0, #0x5dc]
    cmp r0, #0x12
    cmpne r0, #0x13
    beq .L_544
    cmp r0, #0x14
    beq .L_594
    b .L_5e0
.L_544:
    ldr r0, _LIT2
    ldr r8, _LIT3
    mov r4, #0x0
    str r0, [sp, #0x4]
    add r7, sp, #0x0
.L_558:
    mov r0, r4, lsl #0x1
    ldrh r3, [r8, r0]
    mov r0, r6
    mov r1, r7
    mov r2, r5
    str r3, [sp]
    bl func_ov002_0228bcd0
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    add r4, r4, #0x1
    cmp r4, #0x3d
    bcc .L_558
    b .L_5e0
.L_594:
    ldr r0, _LIT4
    ldr r8, _LIT5
    mov r4, #0x0
    str r0, [sp, #0x4]
    add r7, sp, #0x0
.L_5a8:
    mov r0, r4, lsl #0x1
    ldrh r3, [r8, r0]
    mov r0, r6
    mov r1, r7
    mov r2, r5
    str r3, [sp]
    bl func_ov002_0228bcd0
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    add r4, r4, #0x1
    cmp r4, #0x17
    bcc .L_5a8
.L_5e0:
    ldr r4, _LIT6
    mov r7, #0x0
.L_5e8:
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_0228bcd0
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    add r7, r7, #0x1
    cmp r7, #0xca
    add r4, r4, #0x8
    bcc .L_5e8
    cmp r5, #0x0
    bne .L_638
    mov r0, r6
    bl func_ov002_02297d08
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_638:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cd524
_LIT1: .word data_ov002_022ce288
_LIT2: .word func_ov002_02288aa0
_LIT3: .word data_ov002_022c863e
_LIT4: .word func_ov002_02289dfc
_LIT5: .word data_ov002_022c8610
_LIT6: .word data_ov002_022c89a0
