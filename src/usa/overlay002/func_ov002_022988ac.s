; func_ov002_022988ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c9140
        .extern data_ov002_022cd444
        .extern data_ov002_022d008c
        .extern func_ov002_021bcfbc
        .extern func_ov002_021c9b68
        .extern func_ov002_022818c4
        .extern func_ov002_02297048
        .extern func_ov002_022978ac
        .extern func_ov002_02298658
        .global func_ov002_022988ac
        .arm
func_ov002_022988ac:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0x8]
    ldr r4, [r1, #0xcec]
    cmp r0, #0x0
    beq .L_c7c
    cmp r0, #0x1
    beq .L_cbc
    b .L_d1c
.L_c7c:
    ldr r6, _LIT2
    mov r5, #0x0
.L_c84:
    mov r0, r4
    mov r1, r6
    bl func_ov002_02297048
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r5, r5, #0x1
    cmp r5, #0x57
    add r6, r6, #0x8
    bcc .L_c84
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
.L_cbc:
    mov r0, r4
    bl func_ov002_021bcfbc
    cmp r0, #0x2
    blt .L_d14
    mov r0, r4
    bl func_ov002_021c9b68
    cmp r0, #0x0
    beq .L_d14
    mov r0, r4
    bl func_ov002_022818c4
    cmp r0, #0x0
    beq .L_d14
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_022978ac
    cmp r0, #0x0
    beq .L_d14
    mov r0, r4
    bl func_ov002_02298658
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_d14:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_d1c:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd444
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022c9140
