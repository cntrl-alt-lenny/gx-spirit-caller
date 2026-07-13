; func_ov014_021b40b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov014_021b4194
        .extern func_ov014_021b42b8
        .global func_ov014_021b40b8
        .arm
func_ov014_021b40b8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x58]
    cmp r1, #0x0
    beq .L_cb4
    mov r3, #0x4000000
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, ip, #0x10
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    ldr r1, [r4, #0x58]
    tst r1, #0x1
    beq .L_c98
    bl func_ov014_021b4194
.L_c98:
    ldr r0, [r4, #0x58]
    tst r0, #0x2
    beq .L_cac
    mov r0, r4
    bl func_ov014_021b42b8
.L_cac:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_cb4:
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x10
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
