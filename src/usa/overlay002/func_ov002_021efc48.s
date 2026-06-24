; func_ov002_021efc48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021e98b4
        .extern func_ov002_021ea2a0
        .extern func_ov002_021eb874
        .global func_ov002_021efc48
        .arm
func_ov002_021efc48:
    stmdb sp!, {r3, lr}
    ldrh ip, [r0, #0xa]
    ldr r3, _LIT0
    cmp ip, r3
    beq .L_24
    add r3, r3, #0x3
    cmp ip, r3
    beq .L_2c
    b .L_34
.L_24:
    bl func_ov002_021e98b4
    ldmia sp!, {r3, pc}
.L_2c:
    bl func_ov002_021eb874
    ldmia sp!, {r3, pc}
.L_34:
    bl func_ov002_021ea2a0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00001706
