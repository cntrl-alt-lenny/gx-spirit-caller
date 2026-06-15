; func_02023eb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02023eb8
        .arm
func_02023eb8:
    ldrh r0, [r0, #0xce]
    mov r1, r0, lsl #0x1f
    movs r1, r1, lsr #0x1f
    beq .L_174
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_174
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x1
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    b .L_198
.L_174:
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    mov r0, r3, lsl #0x1f
    orr r0, r1, r0, lsr #0x17
    str r0, [r2]
.L_198:
    mov r0, #0x1
    bx lr
