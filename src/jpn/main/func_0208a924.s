; func_0208a924 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a5c5c
        .extern func_0208a77c
        .global func_0208a924
        .arm
func_0208a924:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0
    mov r6, r0
    mov r5, #0x0
.L_124:
    ldr r0, [r4, #0x110]
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq .L_140
    mov r0, r4
    mov r1, r6
    bl func_0208a77c
.L_140:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r4, r4, #0x170
    blt .L_124
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021a5c5c
