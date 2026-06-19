; func_ov002_0225406c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021baca8
        .extern func_ov002_021e30b4
        .global func_ov002_0225406c
        .arm
func_ov002_0225406c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r0, #0x0
    ldr r4, _LIT0
    mov r9, r1
    str r0, [sp]
    mov fp, r0
.L_49c:
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r2, [r0, #0xcec]
    ldr r0, [sp]
    mov r6, #0x0
    eor r5, r2, r0
    ldr r0, _LIT3
    and r2, r5, #0x1
    mla r1, r2, r1, r0
    mov r0, r5, lsl #0x1f
    and r0, r0, #-2147483648
    add r7, r1, #0x30
    orr r8, r0, #0x200000
.L_4d0:
    cmp r5, sl
    cmpeq r6, r9
    beq .L_530
    mov r0, r5
    mov r1, r6
    mov r2, r4
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_530
    mov r0, r6, lsl #0x10
    and r0, r0, #0x1f0000
    orr r1, r8, r0
    orr r0, r1, #0x4c
    ldr r2, [r7]
    orr r0, r0, #0x1000
    mov r1, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r1, r2, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, fp
    bl func_ov002_021e30b4
.L_530:
    add r6, r6, #0x1
    cmp r6, #0x5
    add r7, r7, #0x14
    blt .L_4d0
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
    cmp r0, #0x2
    blt .L_49c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x0000104c
_LIT1: .word data_ov002_022d016c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf16c
