; func_02000e70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern func_02000d9c
        .extern func_02000e34
        .extern func_02000ec8
        .extern SysWork_ClearField0x810
        .global func_02000e70
        .arm
func_02000e70:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    bl SysWork_ClearField0x810
    mov r0, r4
    ldr r0, [r0, #0x3c]
    cmp r0, #0x0
    beq .L_1dc
    cmp r0, #0x1
    beq .L_1e4
    cmp r0, #0x2
    beq .L_1f8
    ldmia sp!, {r4, pc}
.L_1dc:
    bl func_02000e34
    ldmia sp!, {r4, pc}
.L_1e4:
    bl func_02000d9c
    cmp r0, #0x0
    moveq r0, #0x5
    streq r0, [r4, #0xb64]
    ldmia sp!, {r4, pc}
.L_1f8:
    bl func_02000ec8
    ldmia sp!, {r4, pc}
_LIT0: .word data_021040ac
