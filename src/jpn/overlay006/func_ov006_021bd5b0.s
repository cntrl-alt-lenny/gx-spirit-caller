; func_ov006_021bd5b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021bd5b0
        .arm
func_ov006_021bd5b0:
    add r2, r0, #0xa0
    mov r0, #0x24
    mla r3, r1, r0, r2
    ldr r0, [r3, #0x20]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmib r3, {r0, r1}
    addeq r0, r1, r0
    beq .L_34ec
    ldr r2, [r3]
    add r1, r1, r0
    mov r0, #0xa
    mla r0, r1, r0, r2
.L_34ec:
    ldr r1, [r3, #0xc]
    cmp r0, r1
    mvnge r0, #0x0
    bx lr
