; func_ov002_021f6214 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0226af00
        .global func_ov002_021f6214
        .arm
func_ov002_021f6214:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x14]
    ldrh r3, [r0, #0x2]
    mov r0, r1, lsl #0x12
    mov r2, r1, lsl #0x16
    mov r1, r2, lsr #0x1f
    mov r0, r0, lsr #0x1c
    and r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r1, r0, lsl #0x10
    mov r2, r3, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    bl func_ov002_0226af00
    mov r0, #0x1
    ldmia sp!, {r3, pc}
