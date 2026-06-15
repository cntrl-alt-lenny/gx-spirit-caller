; func_0203e400 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203e254
        .extern func_0203e870
        .extern func_0203eaa8
        .global func_0203e400
        .arm
func_0203e400:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xd00
    ldrh r0, [r0, #0x16]
    cmp r0, #0x0
    beq .L_3c
    mov r0, #0x2
    bl func_0203e254
    cmp r0, #0x0
    beq .L_3c
    mov r0, #0x0
    bl func_0203eaa8
    strb r0, [r4, #0xd11]
    mov r0, #0x5
    ldmia sp!, {r4, pc}
.L_3c:
    ldrb r0, [r4, #0xd0b]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    movcs r0, #0x6
    ldmcsia sp!, {r4, pc}
    mov r0, r4
    bl func_0203e870
    ldmia sp!, {r4, pc}
