; func_02074c74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02070d90
        .extern func_02074cdc
        .extern func_02077f8c
        .extern func_020785cc
        .global func_02074c74
        .arm
func_02074c74:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldrb r1, [r5, #0x8]
    ldr r4, [r5, #0xc]
    cmp r1, #0x4
    beq .L_54c
    bl func_02070d90
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r4, r5, lr}
    bxne lr
.L_54c:
    mov r1, #0x0
    strb r1, [r4, #0x455]
    str r1, [r4, #0x1d4]
    add r0, r4, #0x2ec
    strb r1, [r4, #0x454]
    bl func_020785cc
    add r0, r4, #0x3a4
    bl func_02077f8c
    mov r0, r5
    bl func_02074cdc
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
