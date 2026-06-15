; func_0209cda4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a84c0
        .extern func_0209d150
        .extern func_0209d1f0
        .global func_0209cda4
        .arm
func_0209cda4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov sl, r0
    ldr r9, _LIT0
    add r7, sl, #0x20
    ldr r5, _LIT1
    ldr r6, _LIT2
    mov fp, #0x0
    mov r0, #0x200
    rsb r4, r0, #0x0
.L_2e8:
    ldr r0, [r9, #0x1c]
    and r1, r0, r4
    cmp r1, r0
    bne .L_310
    ldr r8, [r9, #0x20]
    ands r0, r8, #0x3
    bne .L_310
    ldr r0, [r9, #0x24]
    cmp r0, #0x200
    bcs .L_318
.L_310:
    mov r8, r7
    str r1, [sl, #0x8]
.L_318:
    mov r0, r1, lsr #0x8
    orr r0, r0, #-1224736768
    mov r1, r1, lsl #0x18
    bl func_0209d150
    ldr r1, [sl, #0x4]
    mov r0, fp
    str r1, [r6]
.L_334:
    ldr r2, [r6]
    ands r1, r2, #0x800000
    beq .L_350
    ldr r1, [r5]
    cmp r0, #0x200
    strcc r1, [r8, r0, lsl #0x2]
    addcc r0, r0, #0x1
.L_350:
    ands r1, r2, #-2147483648
    bne .L_334
    ldr r0, [r9, #0x20]
    cmp r8, r0
    bne .L_398
    ldr r2, [r9, #0x1c]
    ldr r1, [r9, #0x20]
    ldr r0, [r9, #0x24]
    add r2, r2, #0x200
    add r1, r1, #0x200
    subs r0, r0, #0x200
    str r2, [r9, #0x1c]
    str r1, [r9, #0x20]
    str r0, [r9, #0x24]
    bne .L_2e8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_398:
    mov r0, sl
    bl func_0209d1f0
    cmp r0, #0x0
    bne .L_2e8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_021a84c0
_LIT1: .word 0x04100010
_LIT2: .word 0x040001a4
