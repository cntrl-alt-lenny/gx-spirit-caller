; func_ov002_02266ff0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021baca8
        .extern func_ov002_021df62c
        .extern func_ov002_021df938
        .global func_ov002_02266ff0
        .arm
func_ov002_02266ff0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r6, _LIT0
    mov sl, r0
    ldr r3, [r6, #0xd28]
    cmp r3, #0xa
    bcs .L_1d8
    ldr r7, _LIT1
    ldr r5, _LIT2
    mov r4, #0x5
.L_11c:
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
    beq .L_1c4
    ldr r2, _LIT3
    ldr r0, _LIT4
    and r1, r8, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r0, r9, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r0, r8
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r9
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    cmp sl, r8
    movne r2, #0x1
    ldr r3, _LIT1
    moveq r2, #0x0
    mov r0, sl
    mov r1, #0x1f4
    bl func_ov002_021df938
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd28]
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1c4:
    ldr r0, [r6, #0xd28]
    add r3, r0, #0x1
    str r3, [r6, #0xd28]
    cmp r3, #0xa
    bcc .L_11c
.L_1d8:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00001406
_LIT2: .word 0xcccccccd
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x00000868
