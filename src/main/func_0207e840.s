; func_0207e840 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207e92c
        .global func_0207e840
        .arm
func_0207e840:
    ldr r1, [r0, #0x10]
    cmp r1, #0x0
    movgt r2, #0x1
    ldr r1, [r0, #0x4]
    movle r2, #0x0
    eors r1, r2, r1
    beq .L_34
    ldr r2, [r0, #0x18]
    ldrh r1, [r2, #0x2]
    ldr r2, [r2, #0xc]
    add r1, r2, r1, lsl #0x3
    str r1, [r0]
    b .L_4c
.L_34:
    ldr r2, [r0, #0x18]
    ldrh r1, [r2]
    ldr r2, [r2, #0xc]
    add r1, r2, r1, lsl #0x3
    sub r1, r1, #0x8
    str r1, [r0]
.L_4c:
    ldr ip, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xc]
    bx ip
_LIT0: .word func_0207e92c
