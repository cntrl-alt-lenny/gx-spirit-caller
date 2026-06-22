; func_ov002_0221ff18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c8470
        .extern func_ov002_021c84a8
        .extern func_ov002_021de408
        .extern func_ov002_021e276c
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_0221ff18
        .arm
func_ov002_0221ff18:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldrh r2, [r0, #0x2]
    str r0, [sp]
    mov r0, r2, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    beq .L_298
    ldr r0, [sp]
    mov r3, #0x0
    ldrh r1, [r0]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, #0x1
    bl func_ov002_021e276c
.L_298:
    ldr r0, [sp]
    add r2, sp, #0x4
    mov r1, #0x0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_368
    ldr r2, [sp, #0x4]
    ldr r0, [sp]
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r4, r2, #0xff
    and r5, r1, #0xff
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_368
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c8470
    rsb sl, r4, #0x1
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r2, sl, #0x1
    mla r8, r2, r1, r3
    mov r6, #0x0
    mov r4, r0
    mov r5, r6
    add r7, r8, #0x30
    mov r9, sl, lsl #0x4
    mov fp, #0x1
.L_318:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r8, #0x38]
    cmpne r0, #0x0
    beq .L_344
    mov r0, sl
    mov r1, r5
    bl func_ov002_021c84a8
    cmp r0, r4
    orrle r6, r6, fp, lsl r9
.L_344:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r7, r7, #0x14
    add r8, r8, #0x14
    add r9, r9, #0x1
    blt .L_318
    ldr r0, [sp]
    mov r1, r6
    bl func_ov002_021de408
.L_368:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
