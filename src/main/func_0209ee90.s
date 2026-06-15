; func_0209ee90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209ee90
        .arm
func_0209ee90:
    ldrh r1, [r0, #0x4]
    cmp r1, #0x70
    movhi r0, #0x0
    bxhi lr
    ldrh r1, [r0, #0x18]
    cmp r1, #0xa
    bcc .L_94
    cmp r1, #0x3e8
    bls .L_9c
.L_94:
    mov r0, #0x0
    bx lr
.L_9c:
    ldrh r0, [r0, #0x32]
    cmp r0, #0x1
    bcc .L_b0
    cmp r0, #0xe
    bls .L_b8
.L_b0:
    mov r0, #0x0
    bx lr
.L_b8:
    mov r0, #0x1
    bx lr
