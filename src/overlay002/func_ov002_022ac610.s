; func_ov002_022ac610 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022ac610
        .arm
func_ov002_022ac610:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov lr, #0x0
    mov r6, lr
    mov ip, lr
.L_560:
    add r4, lr, #0x4
    mov r5, r4, asr #0x3
    add r7, r0, r5, lsl #0x8
    mov r4, r4, lsl #0x1d
    mov r5, ip
    cmp r2, #0x0
    add r4, r7, r4, lsr #0x1a
    ble .L_5a8
    add r7, r3, r6
.L_584:
    add r9, r1, r5
    mov r8, r9, asr #0x3
    add r5, r5, #0x2
    ldrh sl, [r7], #0x2
    and r9, r9, #0x7
    add r8, r4, r8, lsl #0x6
    strh sl, [r9, r8]
    cmp r5, r2
    blt .L_584
.L_5a8:
    add lr, lr, #0x1
    cmp lr, #0x8
    add r6, r6, #0x8
    blt .L_560
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
