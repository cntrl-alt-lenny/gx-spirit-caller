; func_0208a764 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a5840
        .extern data_021a5d30
        .extern func_0208a6b8
        .extern func_0208a728
        .extern func_0208a8bc
        .global func_0208a764
        .arm
func_0208a764:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x110]
    mov r1, r1, lsl #0x1f
    movs r1, r1, asr #0x1f
    ldmeqia sp!, {r4, pc}
    bl func_0208a728
    ldr r1, [r4, #0x164]
    mov r0, r4
    blx r1
    ldr r0, _LIT0
    mov r1, r4
    bl func_0208a6b8
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_fc
    mov r1, r4
    add r0, r0, #0x4e0
    bl func_0208a6b8
.L_fc:
    mov r0, r4
    bl func_0208a8bc
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a5d30
_LIT1: .word data_021a5840
