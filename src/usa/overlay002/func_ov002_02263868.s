; func_ov002_02263868 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021babc8
        .extern func_ov002_021de850
        .extern func_ov002_021df53c
        .global func_ov002_02263868
        .arm
func_ov002_02263868:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r6, _LIT0
    mov r5, r0
    ldr r4, [r6, #0xd28]
    cmp r4, #0x4
    bhi .L_b4
    ldr r7, _LIT1
.L_1c:
    mov r0, r5
    mov r1, r4
    mov r2, r7
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_a0
    ldr r2, _LIT2
    ldr r0, _LIT3
    and r1, r5, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r0, r4, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r0, r5
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r4
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    mov r2, #0x0
    mov r0, r5
    mov r1, r4
    mov r3, r2
    bl func_ov002_021de850
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd28]
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_a0:
    ldr r0, [r6, #0xd28]
    add r4, r0, #0x1
    str r4, [r6, #0xd28]
    cmp r4, #0x4
    bls .L_1c
.L_b4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00000fbd
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
