; func_0208a6e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a5760
        .extern data_021a5c38
        .extern func_020881ec
        .extern func_0208a67c
        .extern func_02092660
        .extern func_020926d0
        .global func_0208a6e0
        .arm
func_0208a6e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, _LIT0
    bl func_020926d0
    ldr r0, _LIT1
    ldr r1, [r0]
    cmp r1, #0x0
    beq .L_2c
    ldr r0, _LIT2
    add r0, r1, r0
    bl func_020926d0
.L_2c:
    ldr r0, [r4, #0x110]
    mov r0, r0, lsl #0x1e
    movs r0, r0, asr #0x1f
    beq .L_44
    mov r0, r4
    bl func_020881ec
.L_44:
    ldr r0, [r4, #0x110]
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq .L_60
    ldr r1, [r4, #0x16c]
    mov r0, r4
    blx r1
.L_60:
    mov r0, r4
    bl func_0208a67c
    ldr r0, _LIT0
    bl func_02092660
    ldr r0, _LIT1
    ldr r1, [r0]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT2
    add r0, r1, r0
    bl func_02092660
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a5c38
_LIT1: .word data_021a5760
_LIT2: .word 0x000004c8
