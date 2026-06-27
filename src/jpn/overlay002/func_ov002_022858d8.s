; func_ov002_022858d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202f994
        .extern func_ov002_021bd868
        .extern func_ov002_021c9ee4
        .global func_ov002_022858d8
        .arm
func_ov002_022858d8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, r0
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r8, #0x1
    mla r7, r1, r0, r2
    mov r4, #0x0
    add r6, r7, #0x30
    mov sl, r4
    mov r9, #0x1
.L_28:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    movs r5, r0, lsr #0x13
    beq .L_94
    ldrh r0, [r7, #0x38]
    cmp r0, #0x0
    bne .L_54
    mov r0, r8
    bl func_ov002_021c9ee4
    cmp r0, #0x0
    beq .L_94
.L_54:
    ldrh r0, [r7, #0x38]
    cmp r0, #0x0
    bne .L_70
    mov r0, r5
    bl func_0202f994
    cmp r0, #0x0
    bne .L_94
.L_70:
    ldrh r0, [r7, #0x36]
    cmp r0, #0x0
    beq .L_94
    mov r0, r8
    mov r1, r4
    bl func_ov002_021bd868
    cmp r0, #0x0
    strneh sl, [r7, #0x36]
    strneh r9, [r7, #0x38]
.L_94:
    add r4, r4, #0x1
    cmp r4, #0x5
    add r6, r6, #0x14
    add r7, r7, #0x14
    blt .L_28
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
