; func_ov003_021cbdf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005dac
        .extern func_02034784
        .extern func_02034810
        .extern func_020944a4
        .extern func_ov003_021cd420
        .extern func_ov003_021cd7dc
        .extern func_ov003_021ce4e4
        .extern func_ov003_021cec24
        .global func_ov003_021cbdf4
        .arm
func_ov003_021cbdf4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    bl func_02034784
    cmp r0, #0x0
    beq .L_1b84
    bl func_02034810
    mov r0, r0, lsl #0x1
    orr r2, r0, #0x800
    ldr r3, _LIT0
    mov r0, #0x1
    mov r1, #0x0
    str r3, [sp]
    strh r2, [sp, #0x4]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x6
    bl func_020944a4
.L_1b84:
    mov r0, r4
    mov r1, #0x0
    bl func_ov003_021cd420
    mov r0, r4
    mov r1, #0x1
    bl func_ov003_021cd420
    mov r0, r4
    bl func_ov003_021cd7dc
    mov r0, r4
    bl func_ov003_021ce4e4
    bl func_02034784
    cmp r0, #0x2
    bne .L_1bc0
    mov r0, r4
    bl func_ov003_021cec24
.L_1bc0:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word 0x40f02000
