; func_020a09c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9840
        .extern data_021a98fc
        .global func_020a09c8
        .arm
func_020a09c8:
    ldr r1, _LIT0
    mov r2, #0x1
    mov r2, r2, lsl r0
    ldr r1, [r1]
    ands r1, r1, r2
    bxeq lr
    ldr r2, _LIT1
    ldr r1, _LIT2
    ldr r2, [r2]
    mla r3, r0, r1, r2
    add r0, r3, #0x1000
    ldrb r0, [r0, #0xd52]
    cmp r0, #0x0
    bxeq lr
    add r0, r3, #0x1d00
    ldrh r1, [r0, #0x4c]
    cmp r1, #0x0
    bxeq lr
    ldrh r2, [r0, #0x48]
    ldrh ip, [r0, #0x4a]
    cmp ip, r2
    bhi .L_6c
    add r1, ip, #0x2
    cmp r2, r1
    addle r1, r2, #0x1
    strleh r1, [r0, #0x48]
    bxle lr
.L_6c:
    add r0, r3, #0x1d00
    strh ip, [r0, #0x48]
    bx lr
_LIT0: .word data_021a9840
_LIT1: .word data_021a98fc
_LIT2: .word 0x000005d4
