; func_020b3720 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern .L_020b3990
        .global func_020b3720
        .arm
func_020b3720:
    stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
    mov r4, #0x1
    orrs r5, r3, r2
    bne .L_18
    ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
    bx lr
.L_18:
    orrs r5, r1, r3
    .word 0x1affffa5
    mov r1, r2
    bl .L_020b3990
    cmp r4, #0x0
    movne r0, r1
    mov r1, #0x0
    ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
    bx lr
