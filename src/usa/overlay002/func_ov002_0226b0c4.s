; func_ov002_0226b0c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0226ac34
        .global func_ov002_0226b0c4
        .arm
func_ov002_0226b0c4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    strh r1, [sp]
    cmp r3, #0x0
    mov r4, #0x0
    ble .L_38
    add ip, sp, #0x0
.L_1c:
    mov r1, r4, lsl #0x1
    ldrh lr, [r2, r1]
    add r1, ip, r4, lsl #0x1
    add r4, r4, #0x1
    strh lr, [r1, #0x2]
    cmp r4, r3
    blt .L_1c
.L_38:
    add r2, sp, #0x0
    add r3, r3, #0x1
    mov r1, #0xf
    bl func_ov002_0226ac34
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
