; func_ov010_021b3e50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b8c08
        .extern func_02001b84
        .extern func_020068fc
        .extern func_0202aeec
        .extern func_ov010_021b64e4
        .extern func_ov010_021b8508
        .global func_ov010_021b3e50
        .arm
func_ov010_021b3e50:
    stmdb sp!, {r3, lr}
    bl func_0202aeec
    ldr r0, _LIT0
    ldr r0, [r0, #0x3c]
    cmp r0, #0x1
    beq .L_1a0
    cmp r0, #0x2
    beq .L_1a8
    cmp r0, #0x3
    b .L_1ac
.L_1a0:
    bl func_ov010_021b64e4
    b .L_1ac
.L_1a8:
    bl func_ov010_021b8508
.L_1ac:
    bl func_02001b84
    bl func_020068fc
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov010_021b8c08
