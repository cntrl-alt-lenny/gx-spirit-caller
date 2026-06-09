; func_ov002_022b53c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02021660
        .extern func_020216b0
        .extern func_0202c9a0
        .extern func_0202d9a0
        .global func_ov002_022b53c4
        .arm
func_ov002_022b53c4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0202d9a0
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4]
    mov r1, #0x3
    mov r2, #0x0
    bl func_02021660
    mov r4, r0
    bl func_0202c9a0
    cmp r0, #0x0
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r4
    mov r1, #0x0
    bl func_020216b0
    ldmia sp!, {r4, pc}
