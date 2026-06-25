; func_ov002_02297bf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c99c0
        .extern func_0202e1e0
        .extern func_ov002_0228bbc0
        .global func_ov002_02297bf8
        .arm
func_ov002_02297bf8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r7, _LIT0
    mov r6, #0x0
    mov r8, r0
    mov r5, r7
    mov r4, r6
.L_a0:
    ldr r0, [r5, r6, lsl #0x3]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_cc
    mov r0, r8
    mov r1, r7
    mov r2, r4
    bl func_ov002_0228bbc0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_cc:
    add r6, r6, #0x1
    cmp r6, #0x114
    add r7, r7, #0x8
    bcc .L_a0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022c99c0
