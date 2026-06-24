; func_0200b1a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209445c
        .global func_0200b1a0
        .arm
func_0200b1a0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r0, r1
    mov r4, r3
    mov r5, r2
    mov r1, r6
    mov r2, r4, lsl #0x3
    bl func_0209445c
    cmp r4, #0x0
    mov r1, #0x0
    bls .L_44
.L_2c:
    ldr r0, [r6, r1, lsl #0x3]
    add r0, r5, r0
    str r0, [r6, r1, lsl #0x3]
    add r1, r1, #0x1
    cmp r1, r4
    bcc .L_2c
.L_44:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
