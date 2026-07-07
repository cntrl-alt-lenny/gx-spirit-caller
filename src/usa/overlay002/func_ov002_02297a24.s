; func_ov002_02297a24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c8f28
        .extern data_ov002_022cd444
        .extern data_ov002_022d008c
        .extern func_ov002_02297048
        .extern func_ov002_022973ac
        .extern func_ov002_022978ac
        .extern func_ov002_02297c58
        .extern func_ov002_02298658
        .global func_ov002_02297a24
        .arm
func_ov002_02297a24:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0x8]
    ldr r4, [r1, #0xcec]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_bd8
    b .L_b14
    b .L_b54
    b .L_b8c
    b .L_bb0
.L_b14:
    ldr r6, _LIT2
    mov r5, #0x0
.L_b1c:
    mov r0, r4
    mov r1, r6
    bl func_ov002_02297048
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r5, r5, #0x1
    cmp r5, #0x43
    add r6, r6, #0x8
    bcc .L_b1c
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
.L_b54:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022978ac
    cmp r0, #0x0
    beq .L_b7c
    mov r0, r4
    bl func_ov002_02298658
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_b7c:
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
.L_b8c:
    mov r0, r4
    bl func_ov002_02297c58
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
.L_bb0:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022973ac
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
.L_bd8:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd444
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022c8f28
