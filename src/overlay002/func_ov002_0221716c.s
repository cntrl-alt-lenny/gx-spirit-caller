; func_ov002_0221716c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern func_ov002_021d6714
        .extern func_ov002_021e27c0
        .extern func_ov002_021e2b1c
        .extern func_ov002_02213654
        .extern func_ov002_0225764c
        .extern func_ov002_022592ec
        .global func_ov002_0221716c
        .arm
func_ov002_0221716c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r7, r0
    ldrh r1, [r7]
    ldr r0, _LIT0
    mov r4, #0x0
    cmp r1, r0
    ldr r0, _LIT1
    moveq r4, #0x1
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7f
    beq .L_e8
    cmp r0, #0x80
    bne .L_16c
    cmp r4, #0x0
    beq .L_54
    ldrh r0, [r7, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e27c0
.L_54:
    mov r8, #0x0
    mov r4, #0x1
    mov r5, r8
.L_60:
    ldrh r0, [r7, #0x2]
    mov r6, r5
    mov r0, r0, lsl #0x1f
    eor r9, r8, r0, lsr #0x1f
.L_70:
    mov r0, r7
    mov r1, r9
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_98
    mov r0, r9
    mov r1, r6
    mov r2, r4
    bl func_ov002_021d6714
.L_98:
    add r6, r6, #0x1
    cmp r6, #0xa
    ble .L_70
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_60
    ldrh r1, [r7, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_d8
    mov r0, #0x1e
    bl func_ov002_021e2b1c
    b .L_e0
.L_d8:
    ldr r0, _LIT3
    bl func_ov002_022592ec
.L_e0:
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_e8:
    mov r5, #0x0
    mov r8, r5
    mov r9, r5
.L_f4:
    ldrh r0, [r7, #0x2]
    mov r6, r9
    mov r0, r0, lsl #0x1f
    eor sl, r5, r0, lsr #0x1f
.L_104:
    mov r0, r7
    mov r1, sl
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_12c
    mov r0, sl
    mov r1, r6
    mov r2, r8
    bl func_ov002_021d6714
.L_12c:
    add r6, r6, #0x1
    cmp r6, #0xa
    ble .L_104
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_f4
    cmp r4, #0x0
    beq .L_164
    ldrh r0, [r7, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e27c0
.L_164:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_16c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x0000184d
_LIT1: .word data_ov002_022ce288
_LIT2: .word data_ov002_022cd744
_LIT3: .word func_ov002_02213654
