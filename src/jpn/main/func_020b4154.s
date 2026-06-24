; func_020b4154 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b40cc
        .global func_020b4154
        .arm
func_020b4154:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r5, [r2]
    mov r6, r1
    cmp r5, #0x0
    mov r4, #0x0
    bls .L_b4
.L_a0:
    add r0, r6, r4
    bl func_020b40cc
    add r4, r4, #0x1
    cmp r4, r5
    bcc .L_a0
.L_b4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
