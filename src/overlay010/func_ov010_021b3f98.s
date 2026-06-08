; func_ov010_021b3f98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov010_021b8d08
        .extern func_02000ef8
        .extern func_020057dc
        .global func_ov010_021b3f98
        .arm
func_ov010_021b3f98:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r2, [r1, #0xb6c]
    ldr r0, [r0, r2, lsl #0x2]
    cmp r0, #0x0
    beq .L_1fc
    blx r0
    cmp r0, #0x0
    beq .L_1f4
    ldr r0, _LIT0
    ldr r1, [r0, #0xb6c]
    add r1, r1, #0x1
    str r1, [r0, #0xb6c]
.L_1f4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1fc:
    ldr r0, _LIT1
    ldr r0, [r0, #0xa8]
    cmp r0, #0x0
    beq .L_220
    mov r2, #0x0
    str r2, [r1, #0xba0]
    bl func_020057dc
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_220:
    bl func_02000ef8
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_ov010_021b8d08
