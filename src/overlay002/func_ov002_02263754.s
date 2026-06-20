; func_ov002_02263754 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c988c
        .extern func_ov002_021e30b4
        .global func_ov002_02263754
        .arm
func_ov002_02263754:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    str r0, [sp]
    mov fp, #0x0
.L_c:
    ldr r0, [sp]
    ldr r2, _LIT0
    eor r8, r0, fp
    ldr r0, _LIT1
    and r1, r8, #0x1
    mla r2, r1, r0, r2
    ldr r0, [r2, #0x1c]
    subs r7, r0, #0x1
    bmi .L_e4
    mov r0, r8, lsl #0x1f
    and r0, r0, #-2147483648
    add r1, r2, #0x5d0
    orr sl, r0, #0x4f0000
    ldr r4, _LIT2
    add r9, r1, r7, lsl #0x2
    orr sl, sl, #0xa000000
    mov r5, #0x0
    mov r6, #0xf
.L_54:
    ldr r1, [r9]
    mov r0, r1, lsl #0x13
    cmp r4, r0, lsr #0x13
    bne .L_d8
    mov r0, r1, lsl #0xa
    movs r0, r0, lsr #0x1f
    bne .L_d8
    mov r0, r1, lsl #0xb
    movs r0, r0, lsr #0x1f
    bne .L_d8
    mov r0, r8
    mov r1, r6
    mov r2, r7
    bl func_ov002_021c988c
    cmp r0, #0x0
    beq .L_d8
    ldr r3, [r9]
    mov r2, r5
    mov r0, r3, lsl #0x2
    mov r1, r0, lsr #0x18
    mov r0, r3, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    mov r3, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r0, sl, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d8:
    sub r9, r9, #0x4
    subs r7, r7, #0x1
    bpl .L_54
.L_e4:
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0x000016be
