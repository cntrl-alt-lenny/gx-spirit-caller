; func_ov002_02264a00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021baca8
        .extern func_ov002_021e30b4
        .global func_ov002_02264a00
        .arm
func_ov002_02264a00:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r6, _LIT0
    mov sl, r0
    ldr r3, [r6, #0xd28]
    cmp r3, #0xa
    bcs .L_108
    ldr r7, _LIT1
    ldr r5, _LIT2
    mov r4, #0x5
.L_24:
    umull r0, r1, r3, r5
    mov r1, r1, lsr #0x2
    umull r1, r0, r4, r1
    umull r0, r2, r3, r5
    sub r1, r3, r1
    eor r8, sl, r2, lsr #0x2
    add r9, r1, #0x5
    mov r0, r8
    mov r1, r9
    mov r2, r7
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_f4
    ldr r2, _LIT3
    ldr r0, _LIT4
    and r1, r8, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r4, r9, r0
    mov r0, r8
    mov r1, r9
    add r5, r2, #0x30
    bl func_ov002_021b9ecc
    ldr r2, [r5, r4]
    mov r3, r8, lsl #0x1f
    and r4, r3, #-2147483648
    eor r1, r8, sl
    mov r3, r1, lsl #0x18
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    orr r4, r4, #0xa000000
    and r3, r3, #0x1000000
    mov r5, r9, lsl #0x10
    orr r3, r4, r3
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    and r4, r5, #0x1f0000
    orr r2, r3, #0x200000
    orr r2, r4, r2
    mov r0, r0, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd28]
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_f4:
    ldr r0, [r6, #0xd28]
    add r3, r0, #0x1
    str r3, [r6, #0xd28]
    cmp r3, #0xa
    bcc .L_24
.L_108:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x000017f8
_LIT2: .word 0xcccccccd
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x00000868
