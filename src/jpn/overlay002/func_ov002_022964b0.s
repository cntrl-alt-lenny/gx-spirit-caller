; func_ov002_022964b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c3a04
        .extern func_ov002_022579d0
        .extern func_ov002_02281650
        .global func_ov002_022964b0
        .arm
func_ov002_022964b0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3a04
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, #0x1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02281650
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_022579d0
    cmp r0, #0x1
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000198c
