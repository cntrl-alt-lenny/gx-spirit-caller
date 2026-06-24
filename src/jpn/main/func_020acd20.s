; func_020acd20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020acd20
        .arm
func_020acd20:
    cmp r0, #0x0
    beq .L_18
    ldr r3, [r0, #0x4]
    mov r2, r3, lsl #0x16
    movs r2, r2, lsr #0x1d
    bne .L_20
.L_18:
    mov r0, #0x0
    bx lr
.L_20:
    mov r2, r3, lsl #0x14
    movs r2, r2, lsr #0x1e
    beq .L_40
    cmp r2, #0x1
    beq .L_68
    cmp r2, #0x2
    moveq r1, #0x1
    b .L_6c
.L_40:
    cmp r1, #0x0
    ble .L_58
    bic r2, r3, #0xc00
    orr r2, r2, #0x800
    str r2, [r0, #0x4]
    b .L_6c
.L_58:
    biclt r2, r3, #0xc00
    orrlt r2, r2, #0x400
    strlt r2, [r0, #0x4]
    b .L_6c
.L_68:
    mvn r1, #0x0
.L_6c:
    mov r0, r1
    bx lr
