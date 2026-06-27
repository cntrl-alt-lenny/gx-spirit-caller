; func_ov002_022b8320 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_022b856c
        .global func_ov002_022b8320
        .arm
func_ov002_022b8320:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, r4, r5, lr}
    ldrh r3, [sp, #0x14]
    ldrh lr, [sp, #0x14]
    mov r4, r0
    add r1, r4, #0xc00
    add r2, r4, #0x8c
    mov ip, r3, lsl #0x1f
    mov r5, r3, lsl #0x1a
    mov r3, r3, lsl #0x12
    strh lr, [r1, #0x6a]
    add lr, r2, #0xc00
    mov r1, ip, lsr #0x1f
    mov r2, r5, lsr #0x1b
    mov r3, r3, lsr #0x18
    str lr, [sp]
    bl func_ov002_022b856c
    ldrh r0, [sp, #0x18]
    add r2, r4, #0x98
    ldrh r5, [sp, #0x18]
    add r1, r4, #0xc00
    mov lr, r0, lsl #0x1f
    mov ip, r0, lsl #0x1a
    mov r3, r0, lsl #0x12
    mov r0, r4
    strh r5, [r1, #0x6c]
    add r4, r2, #0xc00
    mov r1, lr, lsr #0x1f
    mov r2, ip, lsr #0x1b
    mov r3, r3, lsr #0x18
    str r4, [sp]
    bl func_ov002_022b856c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, lr}
    add sp, sp, #0x10
    bx lr
