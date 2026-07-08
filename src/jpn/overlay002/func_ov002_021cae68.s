; func_ov002_021cae68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern data_ov002_022cf0cc
        .extern func_ov002_021b1e40
        .extern func_ov002_021b29d4
        .extern func_ov002_021b3dec
        .extern func_ov002_021b9dec
        .extern func_ov002_021c0f30
        .global func_ov002_021cae68
        .arm
func_ov002_021cae68:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, _LIT0
    ldrh r0, [r0]
    ldrh r4, [r1, #0x2]
    ldrh r8, [r1, #0x4]
    tst r0, #0x8000
    movne r7, #0x1
    moveq r7, #0x0
    ldrh r5, [r1, #0x6]
    mov r0, r7
    mov r1, r4
    bl func_ov002_021b9dec
    mov r6, r0
    cmp r8, #0x0
    beq .L_348
    mov r0, r7
    mov r1, r4
    bl func_ov002_021c0f30
    ldr r1, _LIT1
    cmp r6, r1
    addne r0, r1, #0x1
    cmpne r6, r0
    beq .L_2cc
    add r0, r1, #0x52
    cmp r6, r0
    beq .L_304
    b .L_338
.L_2cc:
    mov r0, r7
    mov r2, r6
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_338
    ldr r3, _LIT2
    mov r4, #0x0
    mov r0, r7
    mov r1, #0xb
    mov r2, #0x1
    str r4, [sp]
    bl func_ov002_021b1e40
    b .L_338
.L_304:
    mov r0, r7
    mov r2, r6
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_338
    mov r4, #0x0
    mov r0, r7
    mov r3, r6
    mov r1, #0xb
    mov r2, #0x1
    str r4, [sp]
    bl func_ov002_021b1e40
.L_338:
    cmp r5, #0x0
    beq .L_36c
    bl func_ov002_021b29d4
    b .L_36c
.L_348:
    ldr r3, _LIT3
    mov r1, #0x14
    ldr r0, _LIT4
    and r2, r7, #0x1
    mla r3, r2, r0, r3
    mul r1, r4, r1
    ldr r0, [r3, r1]
    bic r0, r0, #0x400000
    str r0, [r3, r1]
.L_36c:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000fa6
_LIT2: .word 0x00000fa7
_LIT3: .word data_ov002_022cf0cc
_LIT4: .word 0x00000868
