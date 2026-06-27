; func_ov002_02259764 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern func_ov002_022591b4
        .extern func_ov002_02259e8c
        .extern func_ov002_02259ff8
        .extern func_ov002_02266138
        .global func_ov002_02259764
        .arm
func_ov002_02259764:
    stmdb sp!, {r4, lr}
    mov r4, #0x0
    bl func_ov002_022591b4
    cmp r0, #0x2
    beq .L_20
    cmp r0, #0x3
    beq .L_4c
    b .L_78
.L_20:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_ov002_02259e8c
    cmp r0, #0x0
    ldr r0, _LIT0
    orrne r4, r4, #0x8
    ldr r0, [r0, #0x4]
    bl func_ov002_02259ff8
    cmp r0, #0x0
    orrne r4, r4, #0x20
    b .L_78
.L_4c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_ov002_02259ff8
    cmp r0, #0x0
    beq .L_78
    ldr r0, _LIT0
    orr r4, r4, #0x10
    ldr r0, [r0, #0x4]
    bl func_ov002_02266138
    cmp r0, #0x0
    orrne r4, r4, #0x20
.L_78:
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd65c
