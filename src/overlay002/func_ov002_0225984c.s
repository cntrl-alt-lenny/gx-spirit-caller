; func_ov002_0225984c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern func_ov002_0225929c
        .extern func_ov002_02259f74
        .extern func_ov002_0225a0e0
        .extern func_ov002_02266220
        .global func_ov002_0225984c
        .arm
func_ov002_0225984c:
    stmdb sp!, {r4, lr}
    mov r4, #0x0
    bl func_ov002_0225929c
    cmp r0, #0x2
    beq .L_20
    cmp r0, #0x3
    beq .L_4c
    b .L_78
.L_20:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_ov002_02259f74
    cmp r0, #0x0
    ldr r0, _LIT0
    orrne r4, r4, #0x8
    ldr r0, [r0, #0x4]
    bl func_ov002_0225a0e0
    cmp r0, #0x0
    orrne r4, r4, #0x20
    b .L_78
.L_4c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_ov002_0225a0e0
    cmp r0, #0x0
    beq .L_78
    ldr r0, _LIT0
    orr r4, r4, #0x10
    ldr r0, [r0, #0x4]
    bl func_ov002_02266220
    cmp r0, #0x0
    orrne r4, r4, #0x20
.L_78:
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd73c
