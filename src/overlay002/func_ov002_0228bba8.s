; func_ov002_0228bba8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0220eb00
        .global func_ov002_0228bba8
        .arm
func_ov002_0228bba8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    cmp r1, #0x0
    mov r4, r0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r1
    add r1, sp, #0x0
    bl func_ov002_0220eb00
    ldrh r1, [r4, #0x2]
    add r0, sp, #0x0
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x0
    movlt r0, #0x1
    movge r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
