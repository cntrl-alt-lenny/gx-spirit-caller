; func_02031a5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02093b08
        .global func_02031a5c
        .arm
func_02031a5c:
    stmdb sp!, {r3, lr}
    ldr r3, [r1, #0x2c]
    mov ip, r0
.L_c:
    ldr ip, [ip, #0x4]
    ldr r2, [ip, #0x2c]
    mov r2, r2, lsr #0x18
    cmp r2, r3, lsr #0x18
    bcc .L_3c
    ldr r0, [ip]
    str r1, [r0, #0x4]
    str ip, [r1, #0x4]
    ldr r0, [ip]
    str r0, [r1]
    str r1, [ip]
    ldmia sp!, {r3, pc}
.L_3c:
    cmp ip, r0
    bne .L_c
    bl func_02093b08
    ldmia sp!, {r3, pc}
