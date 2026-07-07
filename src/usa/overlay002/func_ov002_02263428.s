; func_ov002_02263428 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b9dec
        .extern func_ov002_021e2fc4
        .global func_ov002_02263428
        .arm
func_ov002_02263428:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r6, _LIT0
    ldr r0, [r6, #0xd28]
    cmp r0, #0xa
    bcs .L_11c
    ldr r7, _LIT1
    ldr r4, _LIT2
    ldr r5, _LIT3
    mov fp, #0x14
    mov sl, #0x5
.L_28:
    umull r1, r9, r0, r4
    mov r9, r9, lsr #0x2
    umull r1, r2, sl, r9
    sub r9, r0, r1
    umull r1, r2, r0, r4
    ldr r3, [r6, #0xcec]
    mov r1, r9
    eor r8, r3, r2, lsr #0x2
    mov r0, r8
    bl func_ov002_021b9dec
    sub r1, r0, r5
    cmp r1, #0x8
    addls pc, pc, r1, lsl #0x2
    b .L_108
    b .L_84
    b .L_84
    b .L_108
    b .L_108
    b .L_108
    b .L_84
    b .L_84
    b .L_108
    b .L_84
.L_84:
    ldr r1, _LIT4
    and r3, r8, #0x1
    mla r2, r3, r1, r7
    mul r1, r9, fp
    add r3, r2, r1
    ldrh r3, [r3, #0x38]
    cmp r3, #0x0
    beq .L_108
    add r2, r2, #0x30
    ldr r2, [r2, r1]
    mov r3, r8, lsl #0x1f
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    and r4, r3, #-2147483648
    mov r3, r9, lsl #0x10
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r4, r4, #0xa200000
    and r2, r3, #0x1f0000
    mov r0, r0, lsl #0x10
    orr r2, r4, r2
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e2fc4
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd28]
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_108:
    ldr r0, [r6, #0xd28]
    add r0, r0, #0x1
    str r0, [r6, #0xd28]
    cmp r0, #0xa
    bcc .L_28
.L_11c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0xcccccccd
_LIT3: .word 0x000017d2
_LIT4: .word 0x00000868
