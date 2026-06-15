; func_020b4248 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b41c0
        .global func_020b4248
        .arm
func_020b4248:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r5, [r2]
    mov r6, r1
    cmp r5, #0x0
    mov r4, #0x0
    bls .L_7c
.L_68:
    add r0, r6, r4
    bl func_020b41c0
    add r4, r4, #0x1
    cmp r4, r5
    bcc .L_68
.L_7c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
