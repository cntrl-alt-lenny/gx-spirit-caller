; func_ov002_021f745c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021f4004
        .extern func_ov002_0226adb8
        .global func_ov002_021f745c
        .arm
func_ov002_021f745c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_298
    bl func_ov002_021f4004
    mov r1, r0
    cmp r1, #0x0
    ble .L_298
    ldrh r0, [r4, #0x2]
    mov r2, #0x0
    mov r3, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226adb8
.L_298:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
