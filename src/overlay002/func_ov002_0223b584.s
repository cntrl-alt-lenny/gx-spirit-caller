; func_ov002_0223b584 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_0223b4c4
        .global func_ov002_0223b584
        .arm
func_ov002_0223b584:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, #0x0
    mov r4, #0x5
    ldr r5, _LIT0
    b .L_148
.L_130:
    ldr r0, [r5, #0x69c]
    mov r1, r6
    bl func_ov002_0223b4c4
    add r1, r5, r6, lsl #0x2
    str r0, [r1, #0x6b4]
    add r6, r6, #0x1
.L_148:
    ldr r0, [r5, #0x6a4]
    cmp r0, #0x5
    movgt r0, r4
    cmp r6, r0
    blt .L_130
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
