; func_ov002_02244284 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b878
        .extern func_ov002_021ff400
        .extern func_ov002_0223f684
        .extern func_ov002_0223fa20
        .global func_ov002_02244284
        .arm
func_ov002_02244284:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x14]
    mov r4, r1
    bl func_0202b878
    cmp r0, #0x16
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x14]
    bl func_0202b878
    cmp r0, #0x17
    mov r0, r5
    mov r1, r4
    bne .L_1ec
    bl func_ov002_0223f684
    ldmia sp!, {r3, r4, r5, pc}
.L_1ec:
    bl func_ov002_021ff400
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_0223fa20
    ldmia sp!, {r3, r4, r5, pc}
