; func_ov002_02256208 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021babc8
        .extern func_ov002_021d900c
        .extern func_ov002_021e2ca4
        .extern func_ov002_021e2fc4
        .global func_ov002_02256208
        .arm
func_ov002_02256208:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    rsb r6, r0, #0x1
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r6, #0x1
    mla r2, r1, r0, r2
    mov r0, r6, lsl #0x1f
    and r0, r0, #-2147483648
    mov r7, #0x5
    ldr r5, _LIT2
    add r8, r2, #0x64
    add r9, r2, #0x94
    orr sl, r0, #0x200000
    mov fp, r7
    mov r4, #0x0
.L_14c:
    mov r0, r6
    mov r1, r7
    mov r2, r5
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_1ec
    ldr r0, [r8, #0x40]
    mov r0, r0, lsr #0x5
    tst r0, #0x1
    bne .L_1dc
    ldr r2, [r9]
    mov r0, r7, lsl #0x10
    mov r1, r2, lsl #0x2
    and r0, r0, #0x1f0000
    orr r0, sl, r0
    orr r0, r0, r5
    mov r2, r2, lsl #0x12
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r2, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
    cmp r0, #0x0
    beq .L_1ec
    mov r0, r6
    mov r1, r7
    mov r2, fp
    mov r3, #0x1
    bl func_ov002_021e2ca4
    mov r0, r6
    mov r1, r7
    mov r2, #0x1
    bl func_ov002_021d900c
    b .L_1ec
.L_1dc:
    mov r0, r6
    mov r1, r7
    mov r2, #0x1
    bl func_ov002_021d900c
.L_1ec:
    add r7, r7, #0x1
    cmp r7, #0xa
    add r8, r8, #0x14
    add r9, r9, #0x14
    blt .L_14c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word 0x0000159b
