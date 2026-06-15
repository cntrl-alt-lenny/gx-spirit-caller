; func_020a7440 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a7440
        .arm
func_020a7440:
    cmp r2, #0x0
    beq .L_90
.L_60:
    ldrb ip, [r0], #0x1
    ldrb r3, [r1], #0x1
    cmp ip, r3
    beq .L_88
    ldrb r2, [r0, #-1]
    ldrb r0, [r1, #-1]
    cmp r2, r0
    mvncc r0, #0x0
    movcs r0, #0x1
    bx lr
.L_88:
    subs r2, r2, #0x1
    bne .L_60
.L_90:
    mov r0, #0x0
    bx lr
