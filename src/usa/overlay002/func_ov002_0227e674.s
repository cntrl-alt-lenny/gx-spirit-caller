; func_ov002_0227e674 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdb98
        .extern data_ov002_022cdba8
        .extern func_ov002_0227e65c
        .global func_ov002_0227e674
        .arm
func_ov002_0227e674:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r5, _LIT0
    mov r4, r0
    ldr r0, [r5, #0xc]
    mov r6, #0x0
    cmp r0, #0x0
    bls .L_54
    ldr r7, _LIT1
.L_20:
    mov r0, r6
    bl func_ov002_0227e65c
    cmp r0, #0x0
    ldreq r0, [r7]
    moveq r0, r0, lsl #0x13
    cmpeq r4, r0, lsr #0x13
    moveq r0, r6
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r5, #0xc]
    add r6, r6, #0x1
    cmp r6, r0
    add r7, r7, #0x4
    bcc .L_20
.L_54:
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cdb98
_LIT1: .word data_ov002_022cdba8
