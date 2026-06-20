; func_ov002_02257b48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_ov002_02257464
        .global func_ov002_02257b48
        .arm
func_ov002_02257b48:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r4, r1
    bl func_ov002_02257464
    movs r5, r0
    beq .L_f8
    ldr r1, [r5, #0xc]
    ldr r0, _LIT0
    cmp r1, #0x0
    ldr r6, [r0, #0x48c]
    beq .L_60
    str sl, [r0, #0x48c]
    ldr r2, [r5, #0xc]
    mov r0, sl
    mov r1, r4
    blx r2
    ldr r1, _LIT0
    cmp r0, #0x0
    str r6, [r1, #0x48c]
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r0, #0x1
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_60:
    ldr r0, _LIT0
    mov r7, #0x0
    str r7, [r0, #0x5c0]
    ldr r1, [r5, #0x8]
    cmp r1, #0x0
    beq .L_f8
    ldr r4, _LIT1
    ldr fp, _LIT2
    str sl, [r0, #0x48c]
.L_84:
    and r0, r7, #0x1
    mla r9, r0, fp, r4
    mov r8, #0x0
.L_90:
    ldr r0, [r9, #0x40]
    mov r0, r0, lsr #0x2
    tst r0, #0x1
    bne .L_cc
    ldr r3, [r5, #0x8]
    mov r0, sl
    mov r1, r7
    mov r2, r8
    blx r3
    cmp r0, #0x0
    beq .L_cc
    ldr r1, _LIT0
    mov r0, #0x1
    str r6, [r1, #0x48c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_cc:
    add r8, r8, #0x1
    cmp r8, #0xa
    add r9, r9, #0x14
    ble .L_90
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_84
    ldr r1, _LIT0
    mov r0, #0x0
    str r6, [r1, #0x48c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
