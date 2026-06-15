; func_02092898 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02092898
        .arm
func_02092898:
    mov ip, #0x0
    mov r1, #0x0
.L_34:
    mov r0, #0x0
.L_38:
    orr r2, r1, r0
    mcr p15, 0, ip, c7, c10, 4
    mcr p15, 0, r2, c7, c14, 2
    add r0, r0, #0x20
    cmp r0, #0x400
    blt .L_38
    add r1, r1, #0x40000000
    cmp r1, #0x0
    bne .L_34
    bx lr
