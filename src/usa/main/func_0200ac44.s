; func_0200ac44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02186978
        .extern func_0208e2f4
        .extern func_020b2c38
        .extern func_020b3074
        .extern func_020b30a8
        .extern func_020b30f0
        .global func_0200ac44
        .arm
func_0200ac44:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrsh r0, [r4, #0xe]
    ldrsh r6, [r4, #0xc]
    add r0, r0, #0x1
    strh r0, [r4, #0xe]
    ldrsh r0, [r4, #0xe]
    cmp r0, r6
    blt .L_44
    mov r1, #0x0
    ldrsh r0, [r4, #0xa]
    str r1, [r4]
    b .L_88
.L_44:
    bl func_020b30a8
    mov r5, r0
    mov r0, r6
    bl func_020b30a8
    mov r1, r0
    mov r0, r5
    bl func_020b2c38
    ldrsh r6, [r4, #0x8]
    ldrsh r1, [r4, #0xa]
    mov r5, r0
    sub r0, r1, r6
    bl func_020b30a8
    mov r1, r0
    mov r0, r5
    bl func_020b30f0
    bl func_020b3074
    add r0, r6, r0
.L_88:
    str r0, [r4, #0x4]
    ldr r2, [r4, #0x4]
    ldr r0, _LIT2
    mov r1, #0x3
    bl func_0208e2f4
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02186978
_LIT1: .word data_02186978
_LIT2: .word 0x04000050
