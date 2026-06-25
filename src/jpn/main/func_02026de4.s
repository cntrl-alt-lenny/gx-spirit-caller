; func_02026de4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02026de4
        .arm
func_02026de4:
    cmp r1, #0x0
    bge .L_e8c
    cmp r2, #0x0
    movne r3, #0xf
    add r1, r0, #0x100
    moveq r3, #0x0
    ldrh r2, [r1, #0x6a]
    mov r0, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0xf000
    mov r0, r0, lsl #0x1c
    orr r0, r2, r0, lsr #0x10
    strh r0, [r1, #0x6a]
    b .L_eec
.L_e8c:
    cmp r2, #0x0
    add r2, r0, #0x100
    mov r0, #0x1
    ldrh r3, [r2, #0x6a]
    beq .L_ec8
    mov r0, r0, lsl r1
    mov r1, r3, lsl #0x10
    orr r0, r0, r1, lsr #0x1c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r3, #0xf000
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0x10
    strh r0, [r2, #0x6a]
    b .L_eec
.L_ec8:
    mvn r0, r0, lsl r1
    mov r1, r3, lsl #0x10
    and r0, r0, r1, lsr #0x1c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r3, #0xf000
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0x10
    strh r0, [r2, #0x6a]
.L_eec:
    mov r0, #0x1
    bx lr
