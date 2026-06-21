; func_ov002_0220d858 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0250
        .extern func_0202b878
        .extern func_ov002_021bcfe4
        .global func_ov002_0220d858
        .arm
func_ov002_0220d858:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x16
    cmpne r0, #0x1b
    bne .L_cc
    ldr r1, [r4, #0x14]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x16
    mov r2, r2, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r2, r0, lsr #0x1f
    bne .L_cc
    mov r0, r1, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_cc
    mov r0, r1, lsl #0x10
    movs r0, r0, lsr #0x1f
    beq .L_cc
    mov r0, r1, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    bne .L_cc
    mov r1, r1, lsl #0x17
    ldr r0, _LIT0
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b878
    cmp r0, #0x9
    bne .L_cc
    mov r6, #0x0
    mov r5, #0x5
.L_90:
    ldrh r0, [r4, #0x2]
    mov r1, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bcfe4
    cmp r0, #0x0
    add r5, r5, #0x1
    addne r6, r6, #0x1
    cmp r5, #0xa
    blt .L_90
    cmp r6, #0x3
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_cc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022d0250
