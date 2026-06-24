; func_020218e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02021bd4
        .extern func_02023a14
        .extern func_02024280
        .extern func_02024508
        .extern func_02025624
        .extern func_020276e4
        .extern func_02028700
        .extern func_020291b0
        .extern func_0202a6c4
        .extern func_0208e7a8
        .global func_020218e0
        .arm
func_020218e0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    bl func_0208e7a8
    bl func_02024508
    mov r2, #0x0
    str r2, [r5, #0x4]
    cmp r2, #0x8
    bge .L_360
.L_28c:
    ldr r0, _LIT0
    add r1, r5, #0x34
    mla r4, r2, r0, r1
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_34c
    ldr r0, [r4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_34c
    ldr r0, [r4, #0x14]
    mov r6, #0x0
    cmp r0, #0x0
    ble .L_34c
    add r7, r4, #0x18
.L_2c8:
    ldr r0, [r7]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_338
    b .L_338
    b .L_2f4
    b .L_300
    b .L_30c
    b .L_318
    b .L_324
    b .L_330
.L_2f4:
    ldr r0, [r7, #0x4]
    bl func_02023a14
    b .L_338
.L_300:
    ldr r0, [r7, #0x4]
    bl func_02024280
    b .L_338
.L_30c:
    ldr r0, [r7, #0x4]
    bl func_02025624
    b .L_338
.L_318:
    ldr r0, [r7, #0x4]
    bl func_020276e4
    b .L_338
.L_324:
    ldr r0, [r7, #0x4]
    bl func_020291b0
    b .L_338
.L_330:
    ldr r0, [r7, #0x4]
    bl func_0202a6c4
.L_338:
    ldr r0, [r4, #0x14]
    add r6, r6, #0x1
    cmp r6, r0
    add r7, r7, #0xc
    blt .L_2c8
.L_34c:
    ldr r0, [r5, #0x4]
    add r2, r0, #0x1
    str r2, [r5, #0x4]
    cmp r2, #0x8
    blt .L_28c
.L_360:
    bl func_02028700
    bl func_02021bd4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000618
