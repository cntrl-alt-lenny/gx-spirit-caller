; func_ov002_021bcf18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b8fcc
        .global func_ov002_021bcf18
        .arm
func_ov002_021bcf18:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    cmp r3, #0x0
    movne r8, #0xb
    moveq r8, #0xa
    mov fp, r0
    mov sl, r1
    mov r9, r2
    mov r5, #0x0
    cmp r8, #0x0
    mov r4, #0x0
    ble .L_bc
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, fp, #0x1
    mla r7, r1, r0, r2
    add r6, r7, #0x30
.L_40:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_a8
    cmp r4, #0x5
    bge .L_6c
    mov r0, fp
    mov r1, r4
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    beq .L_a8
.L_6c:
    mov r1, #0x0
    cmp sl, #0x0
    cmpeq r9, #0x0
    moveq r1, #0x1
    cmp sl, #0x0
    ldrneh r0, [r7, #0x38]
    cmpne r0, #0x0
    movne r1, #0x1
    cmp r9, #0x0
    beq .L_a0
    ldrh r0, [r7, #0x38]
    cmp r0, #0x0
    moveq r1, #0x1
.L_a0:
    cmp r1, #0x0
    addne r5, r5, #0x1
.L_a8:
    add r4, r4, #0x1
    cmp r4, r8
    add r6, r6, #0x14
    add r7, r7, #0x14
    blt .L_40
.L_bc:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
