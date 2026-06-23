; func_ov006_021c62c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021c62c0
        .arm
func_ov006_021c62c0:
    ldr r1, [r0, #0x4c]
    add r0, r0, #0x6c
    ldr r3, [r0, r1, lsl #0x4]
    add r2, r0, r1, lsl #0x4
    cmp r3, #0x0
    mov r0, #0x0
    bge .L_628
    cmp r3, #0x0
    mov r0, #0x1
    bge .L_628
.L_604:
    ldr r1, [r2]
    add r1, r1, #0x1
    str r1, [r2]
    ldr r1, [r2, #0x4]
    sub r1, r1, #0x1
    str r1, [r2, #0x4]
    ldr r3, [r2]
    cmp r3, #0x0
    blt .L_604
.L_628:
    cmp r3, #0x6
    bxlt lr
    cmp r3, #0x6
    mov r0, #0x1
    bxlt lr
.L_63c:
    ldr r1, [r2]
    sub r1, r1, #0x1
    str r1, [r2]
    ldr r1, [r2, #0x4]
    add r1, r1, #0x1
    str r1, [r2, #0x4]
    ldr r1, [r2]
    cmp r1, #0x6
    bge .L_63c
    bx lr
