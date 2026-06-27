; func_ov002_02205b5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ff2cc
        .global func_ov002_02205b5c
        .arm
func_ov002_02205b5c:
    stmdb sp!, {r3, lr}
    ldrh ip, [r0, #0x2]
    mov r2, ip, lsl #0x14
    mov r2, r2, lsr #0x1a
    add r2, r2, #0xfa
    add r2, r2, #0xff00
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    cmp r2, #0x1
    bhi .L_258
    ldr r3, [r0, #0x14]
    mov r2, ip, lsl #0x1f
    mov r3, r3, lsl #0x16
    mov r3, r3, lsr #0x1f
    cmp r3, r2, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov002_021ff2cc
    ldmia sp!, {r3, pc}
.L_258:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
