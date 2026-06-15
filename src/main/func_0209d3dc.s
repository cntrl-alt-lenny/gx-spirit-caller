; func_0209d3dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a84c0
        .extern func_02091a8c
        .global func_0209d3dc
        .arm
func_0209d3dc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r5, _LIT0
    mov r6, #0x0
    add r7, r5, #0x44
.L_90c:
    bl OS_DisableIrq
    ldr r1, [r5, #0x114]
    mov r4, r0
    ands r0, r1, #0x8
    bne .L_938
.L_920:
    mov r0, r6
    str r7, [r5, #0x104]
    bl func_02091a8c
    ldr r0, [r5, #0x114]
    ands r0, r0, #0x8
    beq .L_920
.L_938:
    mov r0, r4
    bl OS_RestoreIrq
    ldr r1, [r5, #0x40]
    mov r0, r5
    blx r1
    b .L_90c
_LIT0: .word data_021a84c0
