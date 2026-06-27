; func_ov002_021f914c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern func_ov002_021b939c
        .extern func_ov002_021dea38
        .extern func_ov002_021df1d4
        .global func_ov002_021f914c
        .arm
func_ov002_021f914c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    bl func_ov002_021b939c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0x4
    bhi .L_5b4
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_59c
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT0
    ldr r1, [r0, #0x4]
    mov r3, r2, lsl #0x1f
    cmp r1, r3, lsr #0x1f
    ldreq r0, [r0, #0x20]
    moveq r1, r2, lsl #0x1a
    cmpeq r0, r1, lsr #0x1b
    moveq r0, #0x1
    movne r0, #0x0
    bl func_ov002_021df1d4
    b .L_5b4
.L_59c:
    ldrh r0, [r4, #0x2]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021dea38
.L_5b4:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd314
