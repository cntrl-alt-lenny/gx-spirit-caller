; func_ov015_021b22f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b377c
        .global func_ov015_021b22f4
        .arm
func_ov015_021b22f4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x60]
    ldrsh r3, [r4, #0x56]
    ldrsh r2, [r4, #0x4e]
    cmp r1, r0
    movlt r1, r0
    ldr r0, [r4, #0x5c]
    sub ip, r3, r2
    cmp r1, r0
    movgt r1, r0
    str r1, [r4, #0x68]
    ldr r3, [r4, #0x5c]
    ldr r2, [r4, #0x60]
    cmp r2, r3
    moveq r0, #0x0
    beq .L_54
    sub r0, r1, r2
    mul r0, ip, r0
    sub r1, r3, r2
    bl func_020b377c
.L_54:
    str r0, [r4, #0x4]
    ldmia sp!, {r4, pc}
