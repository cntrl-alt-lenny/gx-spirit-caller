; func_ov002_022630b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021baca8
        .extern func_ov002_021e30b4
        .global func_ov002_022630b0
        .arm
func_ov002_022630b0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r6, _LIT0
    mov sl, r0
    ldr r0, [r6, #0xd28]
    mov r9, r1
    cmp r0, #0xa
    bcs .L_ec
    ldr fp, _LIT1
    ldr r4, _LIT2
    mov r5, r9, lsl #0x10
.L_28:
    umull r1, r8, r0, r4
    mov r8, r8, lsr #0x2
    mov r1, #0x5
    umull r2, r3, r1, r8
    sub r8, r0, r2
    umull r1, r2, r0, r4
    eor r7, sl, r2, lsr #0x2
    mov r0, r7
    mov r1, r8
    mov r2, r9
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_d8
    ldr r0, _LIT3
    and r1, r7, #0x1
    mla r2, r1, r0, fp
    mov r0, #0x14
    mul r0, r8, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r0, r7, lsl #0x1f
    mov r1, r2, lsl #0x2
    and r0, r0, #-2147483648
    mov r1, r1, lsr #0x18
    orr r3, r0, #0xa200000
    mov r0, r8, lsl #0x10
    and r0, r0, #0x1f0000
    orr r0, r3, r0
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r2, #0x0
    orr r0, r0, r5, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
    cmp r0, #0x0
    beq .L_d8
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd28]
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d8:
    ldr r0, [r6, #0xd28]
    add r0, r0, #0x1
    str r0, [r6, #0xd28]
    cmp r0, #0xa
    bcc .L_28
.L_ec:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0xcccccccd
_LIT3: .word 0x00000868
