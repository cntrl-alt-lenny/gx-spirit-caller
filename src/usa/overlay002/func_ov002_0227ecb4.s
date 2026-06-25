; func_ov002_0227ecb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdb98
        .extern data_ov002_022cdba8
        .extern func_ov002_0227e65c
        .global func_ov002_0227ecb4
        .arm
func_ov002_0227ecb4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r8, _LIT0
    mov r7, r0
    ldr r0, [r8, #0xc]
    mov r6, r1
    cmp r0, #0x0
    mov r4, #0x0
    bls .L_63c
    ldr r5, _LIT1
.L_600:
    mov r0, r4
    bl func_ov002_0227e65c
    cmp r0, #0x0
    ldreq r0, [r5]
    moveq r1, r0, lsl #0x13
    cmpeq r6, r1, lsr #0x13
    moveq r0, r0, lsl #0x12
    cmpeq r7, r0, lsr #0x1f
    moveq r0, r4
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r8, #0xc]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_600
.L_63c:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cdb98
_LIT1: .word data_ov002_022cdba8
