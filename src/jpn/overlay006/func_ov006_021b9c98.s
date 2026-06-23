; func_ov006_021b9c98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021b9c98
        .arm
func_ov006_021b9c98:
    ldr r3, [r1]
    ldr r0, [r0]
    mov r1, r3, lsr #0x10
    mov r2, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r3, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r3, r0, asr #0x10
    mov r0, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    cmp r3, r0, asr #0x10
    mov r0, r1, lsl #0x10
    movgt r0, #0x1
    bxgt lr
    cmp r3, r0, asr #0x10
    movlt r0, #0x1
    movge r0, #0x0
    rsb r0, r0, #0x0
    bx lr
