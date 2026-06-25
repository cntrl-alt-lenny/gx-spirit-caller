; func_ov002_0228bae8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bbe70
        .extern func_ov002_0228090c
        .extern func_ov002_02286868
        .global func_ov002_0228bae8
        .arm
func_ov002_0228bae8:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    bl func_ov002_02286868
    cmp r0, #0x0
    beq .L_88
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x0
    beq .L_88
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x8
    add r2, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    mov r3, #0x1
    bl func_ov002_0228090c
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x1
    bl func_ov002_0228090c
    ldr r1, [sp, #0x8]
    ldr r0, [sp, #0x4]
    cmp r1, r0
    addge sp, sp, #0xc
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, pc}
.L_88:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
