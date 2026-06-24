; func_0208a67c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a5760
        .extern data_021a5c50
        .extern func_0208a5d0
        .extern func_0208a640
        .extern func_0208a7d4
        .global func_0208a67c
        .arm
func_0208a67c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x110]
    mov r1, r1, lsl #0x1f
    movs r1, r1, asr #0x1f
    ldmeqia sp!, {r4, pc}
    bl func_0208a640
    ldr r1, [r4, #0x164]
    mov r0, r4
    blx r1
    ldr r0, _LIT0
    mov r1, r4
    bl func_0208a5d0
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_50
    mov r1, r4
    add r0, r0, #0x4e0
    bl func_0208a5d0
.L_50:
    mov r0, r4
    bl func_0208a7d4
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a5c50
_LIT1: .word data_021a5760
