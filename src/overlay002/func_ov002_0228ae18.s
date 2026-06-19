; func_ov002_0228ae18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_022018cc
        .extern func_ov002_0223de94
        .global func_ov002_0228ae18
        .arm
func_ov002_0228ae18:
    stmdb sp!, {r4, r5, r6, lr}
    movs r4, r1
    mov r5, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    ldrh r1, [r5, #0x2]
    and r0, r0, #0xff
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    cmp r1, r0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r6, #0x0
.L_40:
    ldrh r1, [r5, #0x2]
    mov r0, r4
    mov r2, r6
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_022018cc
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    add r6, r6, #0x1
    cmp r6, #0xa
    ble .L_40
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
