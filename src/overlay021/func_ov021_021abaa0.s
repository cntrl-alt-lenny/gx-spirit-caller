; func_ov021_021abaa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov021_021abb40
        .global func_ov021_021abaa0
        .arm
func_ov021_021abaa0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r8, #0x0
    ldr r5, _LIT0
    mov sl, r0
    mov r6, #0x1
    mov r7, r8
    mov fp, r8
    mov r4, #0x5
.L_a8:
    mov r0, sl
    mov r9, r7
    bl func_ov021_021abb40
    mov r2, r0, lsr #0x1f
    smull r3, r1, r5, r0
    add r1, r2, r1, asr #0x1
    smull r1, r2, r4, r1
    sub r1, r0, r1
    add r3, sl, r8, lsl #0x2
    mov r2, fp
    mov r0, fp
    str r1, [r3, #0x74]
    cmp r8, #0x0
    ble .L_100
    ldr r3, [r3, #0x74]
.L_e4:
    add r1, sl, r0, lsl #0x2
    ldr r1, [r1, #0x74]
    add r0, r0, #0x1
    cmp r1, r3
    addeq r2, r2, #0x1
    cmp r0, r8
    blt .L_e4
.L_100:
    cmp r2, #0x2
    movge r9, r6
    cmp r9, #0x0
    bne .L_a8
    add r8, r8, #0x1
    cmp r8, #0xa
    blt .L_a8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x66666667
