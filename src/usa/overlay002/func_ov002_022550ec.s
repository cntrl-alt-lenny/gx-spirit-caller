; func_ov002_022550ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021d8fd0
        .extern func_ov002_021e2fc4
        .global func_ov002_022550ec
        .arm
func_ov002_022550ec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp]
.L_14:
    ldr r0, _LIT0
    mov r4, #0x200
    ldr r3, [r0, #0xcec]
    ldr r0, [sp]
    ldr r2, _LIT1
    eor r0, r3, r0
    str r0, [sp, #0x4]
    and r0, r0, #0x1
    ldr r1, _LIT2
    str r0, [sp, #0xc]
    mla r1, r0, r1, r2
    ldr r0, [sp, #0x4]
    ldr r5, [sp, #0x10]
    mov r0, r0, lsl #0x1f
    and r0, r0, #-2147483648
    orr fp, r0, #0x200000
    add r9, r1, #0x94
    add sl, r1, #0x64
    orr fp, fp, #0x10000000
    mov r6, #0x5
    rsb r4, r4, #0x0
.L_68:
    ldr r0, [r9]
    ldr r8, [sl, #0x3c]
    mov r1, r0, lsl #0x13
    ldr r0, _LIT3
    mov r7, r1, lsr #0x13
    cmp r0, r1, lsr #0x13
    bne .L_12c
    cmp r8, #0x0
    beq .L_12c
    ldr r0, [sp, #0x4]
    mov r1, r6
    mov r2, #0x0
    bl func_ov002_021d8fd0
    ldr r1, [sl, #0x40]
    ldrh r2, [sl, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_12c
    ldr r0, [sp, #0xc]
    bic r3, r5, #0x200
    orr r0, r3, r0, lsl #0x9
    and r2, r8, r4, lsr #0x17
    and r0, r0, r4
    orr r5, r0, r2
    mov r0, r6, lsl #0x10
    and r0, r0, #0x1f0000
    mov r1, r7, lsl #0x10
    orr r0, fp, r0
    orr r0, r0, r1, lsr #0x10
    ldr r1, [r9]
    mov r2, r5
    mov r3, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r5, [sp, #0x10]
    bl func_ov002_021e2fc4
    mov r0, #0x1
    str r0, [sp, #0x8]
.L_12c:
    add r6, r6, #0x1
    cmp r6, #0xa
    add r9, r9, #0x14
    add sl, sl, #0x14
    blt .L_68
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
    cmp r0, #0x2
    blt .L_14
    ldr r0, [sp, #0x8]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word 0x00001403
