; func_02097ea4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02097ea4
        .arm
func_02097ea4:
    cmp r2, #0x0
    beq .L_160
    cmp r2, #0x1
    beq .L_16c
    cmp r2, #0x2
    beq .L_178
    b .L_184
.L_160:
    ldr r2, [r0, #0x24]
    add r1, r1, r2
    b .L_18c
.L_16c:
    ldr r2, [r0, #0x2c]
    add r1, r1, r2
    b .L_18c
.L_178:
    ldr r2, [r0, #0x28]
    add r1, r1, r2
    b .L_18c
.L_184:
    mov r0, #0x0
    bx lr
.L_18c:
    ldr r2, [r0, #0x24]
    cmp r1, r2
    movlt r1, r2
    ldr r2, [r0, #0x28]
    cmp r1, r2
    movgt r1, r2
    str r1, [r0, #0x2c]
    mov r0, #0x1
    bx lr
