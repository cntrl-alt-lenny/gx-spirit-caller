; func_020a5458 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a98f8
        .global func_020a5458
        .arm
func_020a5458:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1]
    mov ip, r0
    add r1, r2, #0x500
    ldrh r1, [r1, #0x28]
    mov r3, r0
    cmp r1, #0x1
    bne .L_19c8
    ldrb r1, [r2, #0x50c]
    cmp r1, #0x0
    moveq r3, #0x1
.L_19c8:
    cmp r3, #0x0
    beq .L_19e0
    add r1, r2, #0x500
    ldrh r1, [r1, #0x26]
    cmp r1, #0x0
    moveq ip, #0x1
.L_19e0:
    cmp ip, #0x0
    bxeq lr
    add r1, r2, #0x500
    ldrh r1, [r1, #0x2a]
    cmp r1, #0x0
    movne r0, #0x1
    bx lr
_LIT0: .word data_021a98f8
