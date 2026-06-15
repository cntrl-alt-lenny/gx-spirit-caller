; func_0209af84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209b16c
        .global func_0209af84
        .arm
func_0209af84:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    mov ip, #0x0
    bne .L_28
    cmp r1, #0x1
    moveq ip, #0x6
    cmp r1, #0x0
    moveq ip, #0x7
    b .L_5c
.L_28:
    cmp r0, #0x1
    bne .L_44
    cmp r1, #0x1
    moveq ip, #0x4
    cmp r1, #0x0
    moveq ip, #0x5
    b .L_5c
.L_44:
    cmp r0, #0x2
    bne .L_5c
    cmp r1, #0x1
    moveq ip, #0x8
    cmp r1, #0x0
    moveq ip, #0x9
.L_5c:
    cmp ip, #0x0
    addeq sp, sp, #0x4
    ldreq r0, _LIT0
    ldmeqfd sp!, {lr}
    bxeq lr
    mov r1, r2
    mov r0, ip
    mov r2, r3
    bl func_0209b16c
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x0000ffff
