; func_0209b050 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209b16c
        .global func_0209b050
        .arm
func_0209b050:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x1
    beq .L_24
    cmp r0, #0x2
    beq .L_34
    cmp r0, #0x3
    beq .L_2c
    b .L_3c
.L_24:
    mov r0, #0x1
    b .L_40
.L_2c:
    mov r0, #0x2
    b .L_40
.L_34:
    mov r0, #0x3
    b .L_40
.L_3c:
    mov r0, #0x0
.L_40:
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldreq r0, _LIT0
    ldmeqfd sp!, {lr}
    bxeq lr
    bl func_0209b16c
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x0000ffff
