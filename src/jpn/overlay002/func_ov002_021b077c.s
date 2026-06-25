; func_ov002_021b077c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d4744
        .extern func_ov002_0229cc34
        .extern func_ov002_0229cc3c
        .extern func_ov002_0229cc44
        .global func_ov002_021b077c
        .arm
func_ov002_021b077c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_0229cc44
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
.L_788:
    bl func_ov002_0229cc34
    mov r3, r0
    ldrh r0, [r3]
    ldrh r1, [r3, #0x2]
    ldrh r2, [r3, #0x4]
    ldrh r3, [r3, #0x6]
    bl func_ov002_021d4744
    bl func_ov002_0229cc3c
    cmp r4, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov002_0229cc44
    cmp r0, #0x0
    beq .L_788
    ldmia sp!, {r4, pc}
