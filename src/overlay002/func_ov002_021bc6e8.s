; func_ov002_021bc6e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022bdfc4
        .extern func_ov002_021bc55c
        .global func_ov002_021bc6e8
        .arm
func_ov002_021bc6e8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r4, _LIT0
    mov r7, r0
    mov r5, #0x0
.L_10:
    ldr r6, [r4, r5, lsl #0x2]
    mov r0, r7
    mov r1, r6
    bl func_ov002_021bc55c
    cmp r0, #0x0
    movne r0, r6
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_10
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022bdfc4
