; func_ov006_021be8ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .global func_ov006_021be8ec
        .arm
func_ov006_021be8ec:
    ldr r1, [r0, #0x40]
    cmp r1, #0x1
    bne .L_18
    ldr r1, [r0, #0x74]
    cmp r1, #0x0
    bne .L_20
.L_18:
    mov r0, #0x0
    bx lr
.L_20:
    ldr r1, _LIT0
    ldr r2, [r0, #0x68]
    ldr r1, [r1, #0x38]
    ldr r0, [r0, #0x64]
    add r1, r1, r2
    subs r2, r1, r0
    ldr r0, _LIT1
    addmi r2, r2, #0x10000
    mvn r1, #0x0
    sub r0, r0, r2
    cmp r0, r1
    movlt r0, r1
    bx lr
_LIT0: .word data_021040ac
_LIT1: .word 0x00002a30
