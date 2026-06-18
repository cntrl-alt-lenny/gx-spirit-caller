; func_ov002_02225420 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b99b4
        .extern func_ov002_021d7268
        .global func_ov002_02225420
        .arm
func_ov002_02225420:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x16
    bne .L_670
    ldr r0, [r4, #0x14]
    mov r1, r1, lsl #0x1f
    mov r2, r1, lsr #0x1f
    mov r1, r0, lsl #0x17
    rsb r0, r2, #0x1
    mov r1, r1, lsr #0x17
    bl func_ov002_021b99b4
    cmp r0, #0x0
    blt .L_670
    ldrh r1, [r4, #0x2]
    ldr r0, [r4, #0x14]
    mov r2, #0x1
    mov r1, r1, lsl #0x1f
    mov r3, r1, lsr #0x1f
    mov r1, r0, lsl #0x17
    rsb r0, r3, #0x1
    mov r1, r1, lsr #0x17
    bl func_ov002_021d7268
.L_670:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
