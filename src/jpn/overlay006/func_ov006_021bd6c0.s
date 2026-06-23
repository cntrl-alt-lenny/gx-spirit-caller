; func_ov006_021bd6c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021bd6c0
        .arm
func_ov006_021bd6c0:
    add r3, r0, #0xa0
    mov r2, #0x24
    mla r2, r1, r2, r3
    ldr r0, [r0, #0x50]
    ldr r1, [r2, #0x4]
    cmp r0, #0x4
    moveq r3, #0x3
    movne r3, #0x4
    mov r0, #0x0
    cmp r1, #0x0
    bge .L_128
    cmp r1, #0x0
    mov r0, #0x1
    bge .L_128
.L_104:
    ldr r1, [r2, #0x4]
    add r1, r1, #0x1
    str r1, [r2, #0x4]
    ldr r1, [r2, #0x8]
    sub r1, r1, #0x1
    str r1, [r2, #0x8]
    ldr r1, [r2, #0x4]
    cmp r1, #0x0
    blt .L_104
.L_128:
    cmp r1, r3
    bxlt lr
    cmp r1, r3
    mov r0, #0x1
    bxlt lr
.L_13c:
    ldr r1, [r2, #0x4]
    sub r1, r1, #0x1
    str r1, [r2, #0x4]
    ldr r1, [r2, #0x8]
    add r1, r1, #0x1
    str r1, [r2, #0x8]
    ldr r1, [r2, #0x4]
    cmp r1, r3
    bge .L_13c
    bx lr
