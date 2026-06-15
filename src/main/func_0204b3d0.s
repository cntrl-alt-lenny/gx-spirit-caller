; func_0204b3d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dcb4
        .global func_0204b3d0
        .arm
func_0204b3d0:
    ldr r2, _LIT0
    mov r3, #0x0
    mov r0, #0xc
.L_30c:
    mul r1, r3, r0
    ldrb r1, [r2, r1]
    cmp r1, #0x0
    addeq r0, r3, #0x64
    andeq r0, r0, #0xff
    bxeq lr
    add r1, r3, #0x1
    and r3, r1, #0xff
    cmp r3, #0x9a
    bcc .L_30c
    mov r0, #0x0
    bx lr
_LIT0: .word data_0219dcb4
