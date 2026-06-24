; func_0201fb8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6590
        .extern data_02191e60
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_0201fc18
        .extern func_0201fcd0
        .global func_0201fb8c
        .arm
func_0201fb8c:
    stmdb sp!, {r3, lr}
    ldrh r0, [r0, #0x2]
    cmp r0, #0x0
    beq .L_18
    bl func_0201f148
    ldmia sp!, {r3, pc}
.L_18:
    mov r0, #0x1
    bl func_0201f0e4
    ldr r0, _LIT0
    ldrh r1, [r0]
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    beq .L_54
    bl func_0201fc18
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r0, #0x9
    bl func_0201f0e4
    ldmia sp!, {r3, pc}
.L_54:
    bl func_0201fcd0
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_78
    ldr r0, _LIT1
    blx r1
.L_78:
    mov r0, #0x9
    bl func_0201f0e4
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191e60
_LIT1: .word data_020c6590
