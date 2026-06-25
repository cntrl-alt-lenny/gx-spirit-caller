; func_ov002_0221bd10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d5918
        .extern func_ov002_021e267c
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .global func_ov002_0221bd10
        .arm
func_ov002_0221bd10:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021e267c
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r1, #0x0
    mov r0, r4
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_a0
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, #0x1
    str r1, [sp]
    mov ip, r0
    ldrh r1, [r4, #0x2]
    mov r0, ip, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    str r1, [sp, #0x4]
    mov r2, r0, asr #0x8
    ldrh r3, [r4]
    mov r0, r4
    and r1, ip, #0xff
    and r2, r2, #0xff
    bl func_ov002_021d5918
.L_a0:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
