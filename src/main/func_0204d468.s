; func_0204d468 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern func_020498f0
        .global func_0204d468
        .arm
func_0204d468:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    ldr r1, [r5]
    mov r6, r0
    add r4, r1, #0x2
    cmp r4, #0x2
    bls .L_34
    bl func_020498f0
    sub r2, r4, #0x2
    add r1, r0, #0x350
    add r0, r5, #0x4
    mov r2, r2, lsl #0x2
    bl Copy32
.L_34:
    bl func_020498f0
    sub r1, r4, #0x1
    str r1, [r0, #0x348]
    bl func_020498f0
    str r6, [r0, #0x34c]
    ldmia sp!, {r4, r5, r6, pc}
