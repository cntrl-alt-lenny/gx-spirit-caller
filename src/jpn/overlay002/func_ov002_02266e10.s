; func_ov002_02266e10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021babc8
        .extern func_ov002_021c3270
        .extern func_ov002_021df53c
        .extern func_ov002_021df848
        .global func_ov002_02266e10
        .arm
func_ov002_02266e10:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r1, _LIT0
    mov r7, r0
    ldr r0, [r1, #0xd28]
    ldr r8, _LIT0
    cmp r0, #0x0
    moveq r0, #0x5
    streq r0, [r1, #0xd28]
    ldr r5, [r8, #0xd28]
    cmp r5, #0xa
    bcs .L_1ec
    ldr r9, _LIT1
    rsb r6, r7, #0x1
.L_140:
    mov r0, r7
    mov r1, r5
    mov r2, r9
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_1d8
    mov r0, r6
    bl func_ov002_021c3270
    movs r4, r0
    beq .L_1d8
    ldr r2, _LIT2
    ldr r0, _LIT3
    and r1, r7, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r0, r5, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r0, r7
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r5
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    mov r0, #0x64
    mul r1, r4, r0
    ldr r3, _LIT1
    mov r0, r6
    mov r2, #0x1
    bl func_ov002_021df848
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd28]
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1d8:
    ldr r0, [r8, #0xd28]
    add r5, r0, #0x1
    str r5, [r8, #0xd28]
    cmp r5, #0xa
    bcc .L_140
.L_1ec:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00001491
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
