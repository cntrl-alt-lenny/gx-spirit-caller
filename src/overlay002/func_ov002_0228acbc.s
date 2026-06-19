; func_ov002_0228acbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0223de94
        .extern func_ov002_022575c8
        .global func_ov002_0228acbc
        .arm
func_ov002_0228acbc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r2, [r1, #0x2]
    ldrh r0, [r4, #0x2]
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r2, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r1
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    mov r0, r4
    and r1, r1, #0xff
    and r2, r2, #0xff
    bl func_ov002_022575c8
    ldmia sp!, {r4, pc}
