; func_02067194 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ea8c
        .extern data_0219ea90
        .extern func_02054ed0
        .global func_02067194
        .arm
func_02067194:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl func_02054ed0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r1, _LIT0
    mov r2, #0x0
    str r2, [r1]
    ldr ip, _LIT1
.L_dc:
    ldr r3, [r1]
    ldr r2, [r0, #0xc]
    mov r5, r3, lsl #0x2
    ldr r4, [r2, r3, lsl #0x2]
    cmp r4, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldrb r3, [r4]
    ldrb r2, [r4, #0x1]
    add lr, ip, r5
    strb r3, [ip, r5]
    strb r2, [lr, #0x1]
    ldrb r3, [r4, #0x2]
    ldrb r2, [r4, #0x3]
    strb r3, [lr, #0x2]
    strb r2, [lr, #0x3]
    ldr r2, [r1]
    add r2, r2, #0x1
    str r2, [r1]
    cmp r2, #0x5
    blt .L_dc
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219ea8c
_LIT1: .word data_0219ea90
