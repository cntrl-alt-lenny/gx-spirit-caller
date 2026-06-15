; func_ov006_021c34c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02021660
        .extern func_020216b0
        .extern func_02034784
        .extern func_02034810
        .global func_ov006_021c34c0
        .arm
func_ov006_021c34c0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, [r0, #0x8]
    mov r1, #0x5
    mov r2, #0x0
    bl func_02021660
    mov r4, r0
    bl func_02034784
    cmp r0, #0x0
    beq .L_ff4
    ldr r5, _LIT0
    bl func_02034784
    cmp r0, #0x1
    movne r7, #0x1
    moveq r7, #0x0
    bl func_02034810
    mov r6, r0
    b .L_1000
.L_ff4:
    mov r5, #0x0
    mov r7, r5
    mov r6, r5
.L_1000:
    mov r0, r4
    mov r1, #0x3
    mov r2, #0xf8
    bl func_020216b0
    mov r0, r4
    mov r1, #0x4
    mov r2, #0x8
    bl func_020216b0
    mov r0, r4
    mov r1, #0x11
    mov r2, #0x0
    bl func_020216b0
    mov r0, r4
    mov r1, #0x12
    mov r2, #0x0
    bl func_020216b0
    mov r2, r7
    mov r0, r4
    mov r1, #0xc
    bl func_020216b0
    mov r2, r6
    mov r0, r4
    mov r1, #0xd
    bl func_020216b0
    mov r0, r4
    mov r2, r5
    mov r1, #0x0
    bl func_020216b0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x000008c1
