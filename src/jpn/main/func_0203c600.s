; func_0203c600 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3988
        .global func_0203c600
        .arm
func_0203c600:
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r1, [r0, #0xb0]
    tst r1, #0x4000
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    ldr r2, [r0, #0x78]
    ldr r1, [r0, #0x74]
    ldr r2, [r2, #0x20]
    mov r0, #0x3e8
    mul r0, r2, r0
    ldrh r1, [r1, #0x1c]
    bl func_020b3988
    cmp r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, pc}
