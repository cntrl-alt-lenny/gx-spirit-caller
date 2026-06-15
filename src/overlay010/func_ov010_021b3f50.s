; func_ov010_021b3f50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b8d08
        .extern func_02001ba4
        .extern func_02006918
        .extern func_0202af40
        .extern func_ov010_021b65e4
        .extern func_ov010_021b8608
        .global func_ov010_021b3f50
        .arm
func_ov010_021b3f50:
    stmdb sp!, {r3, lr}
    bl func_0202af40
    ldr r0, _LIT0
    ldr r0, [r0, #0x3c]
    cmp r0, #0x1
    beq .L_1a0
    cmp r0, #0x2
    beq .L_1a8
    cmp r0, #0x3
    b .L_1ac
.L_1a0:
    bl func_ov010_021b65e4
    b .L_1ac
.L_1a8:
    bl func_ov010_021b8608
.L_1ac:
    bl func_02001ba4
    bl func_02006918
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov010_021b8d08
