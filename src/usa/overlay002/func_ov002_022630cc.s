; func_ov002_022630cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021babc8
        .extern func_ov002_021e2fc4
        .global func_ov002_022630cc
        .arm
func_ov002_022630cc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r5, _LIT0
    mov sl, r0
    ldr r0, [r5, #0xd28]
    mov r9, r1
    cmp r0, #0x5
    bcs .L_1d4
    ldr r3, _LIT1
    ldr r1, _LIT2
    and r2, sl, #0x1
    mla r3, r2, r1, r3
    mov r1, sl, lsl #0x1f
    and r1, r1, #-2147483648
    orr r8, r1, #0xa200000
    mov r4, r9, lsl #0x10
    add r6, r3, #0x30
    mov fp, #0x14
.L_148:
    add r7, r0, #0x5
    mov r0, sl
    mov r1, r7
    mov r2, r9
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_1c0
    mul r0, r7, fp
    ldr r1, [r6, r0]
    mov r2, r7, lsl #0x10
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    and r2, r2, #0x1f0000
    add r0, r0, r1, lsr #0x1f
    orr r3, r8, r2
    mov r1, r0, lsl #0x10
    mov r2, #0x0
    orr r0, r3, r4, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
    cmp r0, #0x0
    beq .L_1c0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd28]
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c0:
    ldr r0, [r5, #0xd28]
    add r0, r0, #0x1
    str r0, [r5, #0xd28]
    cmp r0, #0x5
    bcc .L_148
.L_1d4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
