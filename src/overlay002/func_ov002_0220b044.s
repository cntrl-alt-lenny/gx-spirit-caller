; func_ov002_0220b044 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bd364
        .extern func_ov002_021ca698
        .global func_ov002_0220b044
        .arm
func_ov002_0220b044:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    bl func_ov002_021ca698
    cmp r0, #0x0
    beq .L_48
    ldrh r0, [r4, #0x2]
    mov r1, #0x7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bd364
    cmp r0, #0x0
    movne r0, #0x2
    ldmneia sp!, {r4, pc}
.L_48:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
