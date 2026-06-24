; func_0200dd3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_0201098c
        .extern func_02010a7c
        .global func_0200dd3c
        .arm
func_0200dd3c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x60]
    mov r1, r2, lsl #0x7
    mov r1, r1, lsr #0x1c
    add r1, r1, #0x1
    bic r2, r2, #0x1e00000
    mov r1, r1, lsl #0x1c
    orr r2, r2, r1, lsr #0x7
    mov r1, r2, lsl #0x7
    mov r1, r1, lsr #0x1c
    str r2, [r4, #0x60]
    cmp r1, #0x2
    ldmlsia sp!, {r4, pc}
    bl func_0201098c
    mov r0, r4
    bl func_02010a7c
    ldr r1, [r4, #0x58]
    cmp r1, #0x0
    beq .L_e28
    ldr r0, [r4, #0x5c]
    blx r1
.L_e28:
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x284
    bl Fill32
    ldmia sp!, {r4, pc}
