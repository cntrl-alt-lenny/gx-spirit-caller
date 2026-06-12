; func_ov002_022348f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021e13f4
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .global func_ov002_022348f0
        .arm
func_ov002_022348f0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r0
    bl func_ov002_021e2b3c
    mov r4, #0x0
    mov r9, #0x1
    ldr r6, _LIT0
    mov r8, r4
    mov r7, r9
.L_20:
    ldrh r1, [r5, #0x2]
    ldr r0, [r6, #0xcec]
    eor r0, r0, r4
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    movne r2, r9
    moveq r2, r8
    mov r1, r7
    bl func_ov002_021e13f4
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_20
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022d016c
