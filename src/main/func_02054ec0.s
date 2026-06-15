; func_02054ec0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02054ec0
        .arm
func_02054ec0:
    ldr r3, [r0]
    mov r1, r3, lsr #0x18
    mov r0, r3, lsr #0x8
    mov r2, r3, lsl #0x8
    and r1, r1, #0xff
    and r0, r0, #0xff00
    mov r3, r3, lsl #0x18
    orr r0, r1, r0
    and r2, r2, #0xff0000
    and r1, r3, #-16777216
    orr r0, r2, r0
    orr r1, r1, r0
    mov r0, r1, lsr #0x18
    and r2, r0, #0xff
    mov r0, r1, lsr #0x10
    and r0, r0, #0xff
    cmp r2, #0xa
    moveq r0, #0x1
    bxeq lr
    cmp r2, #0xac
    bne .L_68
    cmp r0, #0x10
    blt .L_68
    cmp r0, #0x1f
    movle r0, #0x1
    bxle lr
.L_68:
    cmp r2, #0xc0
    bne .L_7c
    cmp r0, #0xa8
    moveq r0, #0x1
    bxeq lr
.L_7c:
    mov r0, #0x0
    bx lr
