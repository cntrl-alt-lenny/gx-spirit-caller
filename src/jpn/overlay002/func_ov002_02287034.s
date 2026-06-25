; func_ov002_02287034 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021bbff4
        .extern func_ov002_02280870
        .global func_ov002_02287034
        .arm
func_ov002_02287034:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r3, [r1, #0xcec]
    rsb r2, r0, #0x1
    cmp r3, r2
    ldreq r1, [r1, #0xcf8]
    cmpeq r1, #0x0
    bne .L_18c
    bl func_ov002_02280870
    cmp r0, #0x0
    bgt .L_184
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r2, r1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbff4
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_184:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_18c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c
