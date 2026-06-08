; func_ov002_021b085c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d4834
        .extern func_ov002_0229cd44
        .extern func_ov002_0229cd4c
        .extern func_ov002_0229cd54
        .global func_ov002_021b085c
        .arm
func_ov002_021b085c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_0229cd54
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
.L_788:
    bl func_ov002_0229cd44
    mov r3, r0
    ldrh r0, [r3]
    ldrh r1, [r3, #0x2]
    ldrh r2, [r3, #0x4]
    ldrh r3, [r3, #0x6]
    bl func_ov002_021d4834
    bl func_ov002_0229cd4c
    cmp r4, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov002_0229cd54
    cmp r0, #0x0
    beq .L_788
    ldmia sp!, {r4, pc}
