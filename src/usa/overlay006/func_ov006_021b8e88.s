; func_ov006_021b8e88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021b8e88
        .arm
func_ov006_021b8e88:
    add r0, r0, #0xc000
    ldr r2, [r0, #0xa94]
    cmp r1, r2
    movge r0, #0x0
    ldrlt r2, [r0, #0xa90]
    movlt r0, r1, lsl #0x1
    ldrlth r0, [r2, r0]
    bx lr
