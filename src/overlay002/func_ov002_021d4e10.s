; func_ov002_021d4e10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd968
        .extern data_ov002_022cdc68
        .extern data_ov002_022cdc6c
        .extern data_ov002_022cdc74
        .extern data_ov002_022ce950
        .extern func_ov002_021b1458
        .extern func_ov002_021d48f4
        .extern func_ov002_0229cd70
        .global func_ov002_021d4e10
        .arm
func_ov002_021d4e10:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldrh r0, [r0, #0xc]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_548
    cmp r0, #0x1
    beq .L_598
    cmp r0, #0x2
    beq .L_5dc
    b .L_608
.L_548:
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, #0x8
    bl func_ov002_0229cd70
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0x80c]
    mov r1, #0x0
    ldr r2, _LIT3
    str r1, [r0, #0x810]
    ldrh r1, [r2]
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0
    strh r0, [r2]
.L_598:
    bl func_ov002_021d48f4
    ldr r0, _LIT1
    ldr r0, [r0, #0x80c]
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
    ldr r2, _LIT3
    ldrh r1, [r2]
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0
    strh r0, [r2]
.L_5dc:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x8
    bl func_ov002_021b1458
    ldr r1, _LIT4
    mov r0, #0x1
    ldr r2, [r1, #0x300]
    bic r2, r2, #0x4
    str r2, [r1, #0x300]
    ldmia sp!, {r3, pc}
.L_608:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cdc68
_LIT1: .word data_ov002_022ce950
_LIT2: .word data_ov002_022cdc6c
_LIT3: .word data_ov002_022cdc74
_LIT4: .word data_ov002_022cd968
