; func_0208a7c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a5840
        .extern data_021a5d18
        .extern func_020882d4
        .extern func_0208a764
        .extern func_02092748
        .extern func_020927b8
        .global func_0208a7c8
        .arm
func_0208a7c8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, _LIT0
    bl func_020927b8
    ldr r0, _LIT1
    ldr r1, [r0]
    cmp r1, #0x0
    beq .L_13c
    ldr r0, _LIT2
    add r0, r1, r0
    bl func_020927b8
.L_13c:
    ldr r0, [r4, #0x110]
    mov r0, r0, lsl #0x1e
    movs r0, r0, asr #0x1f
    beq .L_154
    mov r0, r4
    bl func_020882d4
.L_154:
    ldr r0, [r4, #0x110]
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq .L_170
    ldr r1, [r4, #0x16c]
    mov r0, r4
    blx r1
.L_170:
    mov r0, r4
    bl func_0208a764
    ldr r0, _LIT0
    bl func_02092748
    ldr r0, _LIT1
    ldr r1, [r0]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT2
    add r0, r1, r0
    bl func_02092748
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a5d18
_LIT1: .word data_021a5840
_LIT2: .word 0x000004c8
