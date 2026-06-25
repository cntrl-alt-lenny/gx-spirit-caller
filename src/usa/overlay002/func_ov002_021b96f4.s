; func_ov002_021b96f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0170
        .global func_ov002_021b96f4
        .arm
func_ov002_021b96f4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, #0x0
    ldr r3, _LIT0
    mov ip, r5
.L_590:
    eor lr, r0, r5
    mov r4, ip
    mov r6, lr
.L_59c:
    mov r2, r6, lsl #0x2
    ldrh r2, [r3, r2]
    mov r2, r2, lsl #0x13
    cmp r1, r2, lsr #0x13
    addeq r0, lr, r4, lsl #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    add r4, r4, #0x1
    cmp r4, #0x80
    add r6, r6, #0x2
    blt .L_59c
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_590
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022d0170
