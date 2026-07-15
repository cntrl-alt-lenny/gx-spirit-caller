; func_ov015_021b2390 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b377c
        .global func_ov015_021b2390
        .arm
func_ov015_021b2390:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrsh r3, [r4, #0x56]
    ldrsh r0, [r4, #0x4e]
    movs r2, r1
    sub r3, r3, r0
    str r1, [r4, #0x64]
    moveq r0, #0x0
    streq r0, [r4, #0xc]
    ldmeqia sp!, {r4, pc}
    ldr r1, [r4, #0x60]
    ldr r0, [r4, #0x5c]
    cmp r0, r1
    moveq r0, #0x0
    streq r0, [r4, #0xc]
    ldmeqia sp!, {r4, pc}
    sub r0, r0, r1
    cmp r2, r0, lsl #0x1
    mov r1, r0, lsl #0x1
    strge r3, [r4, #0xc]
    ldmgeia sp!, {r4, pc}
    mul r0, r3, r2
    bl func_020b377c
    str r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
