; func_ov002_0226d8f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern func_ov002_021bc5ac
        .extern func_ov002_02275770
        .extern func_ov002_02275848
        .extern func_ov002_02275924
        .global func_ov002_0226d8f4
        .arm
func_ov002_0226d8f4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r3, _LIT0
    mov r7, r0
    ldr r0, [r3]
    ldr r2, _LIT1
    bic r8, r0, #0x1
    and r4, r7, #0x1
    ldr r0, _LIT2
    orr r4, r8, r4
    and r4, r4, r0
    mov r0, r1, lsl #0x11
    orr r0, r4, r0, lsr #0x9
    str r0, [r3]
    ldrh r0, [r3, #0x16]
    mov r4, #0x0
    cmp r1, r2
    orr r0, r0, #0x2
    strh r0, [r3, #0x16]
    strb r4, [r3, #0x8]
    beq .L_70
    add r0, r2, #0x1
    cmp r1, r0
    beq .L_7c
    add r0, r2, #0x25
    cmp r1, r0
    ldreq r6, _LIT3
    moveq r5, #0x2
    b .L_84
.L_70:
    ldr r6, _LIT4
    mov r5, #0x3
    b .L_84
.L_7c:
    ldr r6, _LIT5
    mov r5, #0x3
.L_84:
    mov sl, #0x0
    mov r8, #0x1
    mov r9, sl
.L_90:
    mov r0, r7
    mov r1, sl
    mov r2, r9
    blx r6
    cmp r0, #0x0
    beq .L_b4
    cmp sl, #0x4
    movle r4, r8
    sub r5, r5, #0x1
.L_b4:
    add sl, sl, #0x1
    cmp sl, #0xa
    ble .L_90
    cmp r5, #0x0
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r4, #0x0
    bne .L_e8
    mov r0, r7
    bl func_ov002_021bc5ac
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_e8:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word 0x000019a3
_LIT2: .word 0xff8000ff
_LIT3: .word func_ov002_02275924
_LIT4: .word func_ov002_02275770
_LIT5: .word func_ov002_02275848
