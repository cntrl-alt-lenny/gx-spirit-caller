; func_02052398 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e3ec
        .global func_02052398
        .arm
func_02052398:
    ldr r2, _LIT0
    ldr r3, [r2]
    cmp r3, #0x0
    bxeq lr
    mov r1, #0x30
    mul r1, r0, r1
    add r0, r3, r1
    mov r3, #0x0
    str r3, [r0, #0xc]
    ldr r0, [r2]
    add r0, r0, r1
    str r3, [r0, #0x10]
    ldr r0, [r2]
    add r0, r0, r1
    str r3, [r0, #0x14]
    ldr r0, [r2]
    add r0, r0, r1
    str r3, [r0, #0x18]
    ldr r0, [r2]
    add r0, r0, r1
    strb r3, [r0, #0x1c]
    ldr r0, [r2]
    add r2, r0, #0x1d
    ldrb r0, [r2, r1]
    add r2, r2, r1
    cmp r0, #0x0
    movne r0, #0x1
    strneb r0, [r2]
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0]
    add r0, r0, r1
    strh r2, [r0, #0x22]
    bx lr
_LIT0: .word data_0219e3ec
