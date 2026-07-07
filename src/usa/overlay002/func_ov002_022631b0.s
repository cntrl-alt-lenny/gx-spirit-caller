; func_ov002_022631b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021babc8
        .extern func_ov002_021e2fc4
        .global func_ov002_022631b0
        .arm
func_ov002_022631b0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r6, _LIT0
    mov sl, r0
    ldr r0, [r6, #0xd28]
    cmp r0, #0xa
    bcs .L_f0
    ldr r7, _LIT1
    ldr r4, _LIT2
    mov r5, sl, lsl #0x10
    mov fp, #0x5
.L_28:
    umull r1, r2, r0, r4
    mov r2, r2, lsr #0x2
    umull r1, r2, fp, r2
    sub r2, r0, r1
    add r9, r2, #0x5
    umull r1, r2, r0, r4
    ldr r0, [r6, #0xcec]
    mov r1, r9
    eor r8, r0, r2, lsr #0x2
    mov r0, r8
    mov r2, sl
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_dc
    ldr r0, _LIT3
    and r1, r8, #0x1
    mla r2, r1, r0, r7
    mov r0, #0x14
    mul r0, r9, r0
    add r1, r2, #0x30
    ldr r3, [r1, r0]
    mov r1, r8, lsl #0x1f
    mov r0, r3, lsl #0x2
    mov r2, r0, lsr #0x18
    and r1, r1, #-2147483648
    mov r0, r9, lsl #0x10
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    mov r3, r2, lsl #0x10
    orr r1, r1, #0xa200000
    and r0, r0, #0x1f0000
    orr r0, r1, r0
    mov r2, #0x0
    orr r0, r0, r5, lsr #0x10
    mov r1, r3, lsr #0x10
    bl func_ov002_021e2fc4
    cmp r0, #0x0
    beq .L_dc
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd28]
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_dc:
    ldr r0, [r6, #0xd28]
    add r0, r0, #0x1
    str r0, [r6, #0xd28]
    cmp r0, #0xa
    bcc .L_28
.L_f0:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0xcccccccd
_LIT3: .word 0x00000868
