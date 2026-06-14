; func_ov006_021b53d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f330
        .extern data_ov006_0225dc34
        .extern data_ov006_0225deb4
        .extern func_ov006_021b52d0
        .extern func_ov006_021c50c4
        .extern func_ov006_021c6c2c
        .global func_ov006_021b53d4
        .arm
func_ov006_021b53d4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r4, [r1, #0x44]
    ldr r5, [r1, #0x48]
    bl func_ov006_021c6c2c
    ldr r0, _LIT0
    bl func_ov006_021c50c4
    bl func_ov006_021b52d0
    cmp r4, #0x0
    beq .L_48
    cmp r4, #0x1
    bne .L_48
    ldr r0, _LIT2
    mov r1, #0x5
    str r5, [r0, #0x10]
    str r1, [r0]
    b .L_54
.L_48:
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0]
.L_54:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov006_0225dc34
_LIT1: .word data_ov006_0225deb4
_LIT2: .word data_ov006_0224f330
