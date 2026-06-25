; func_0203ed84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020beb98
        .extern func_0203c7c4
        .extern func_0203ecdc
        .extern func_0203ed30
        .extern func_02094688
        .global func_0203ed84
        .arm
func_0203ed84:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r4, r2
    mov r5, r1
    ldr r0, _LIT0
    mov r1, r4
    mov r2, #0x58
    bl func_02094688
    ldr r0, [r6]
    str r0, [r4, #0x4]
    ldr r0, [r6, #0x4]
    str r0, [r4, #0x8]
    ldrb r0, [r5, #0xd0d]
    cmp r0, #0x6
    ldmcsia sp!, {r4, r5, r6, pc}
    bl func_0203c7c4
    add r5, r5, r0, lsl #0x8
    ldrb r0, [r5, #0xc0]
    cmp r0, #0x0
    beq .L_98
    mov r0, #0x0
    str r0, [r4, #0xc]
    add r0, r5, #0xc0
    bl func_0203ed30
    str r0, [r4, #0x10]
    ldrb r0, [r5, #0xd0]
    bl func_0203ecdc
    str r0, [r4, #0x14]
    add r0, r5, #0xc4
    bl func_0203ed30
    str r0, [r4, #0x18]
    add r0, r5, #0xc8
    bl func_0203ed30
    str r0, [r4, #0x1c]
    add r0, r5, #0xcc
    bl func_0203ed30
    str r0, [r4, #0x20]
    ldmia sp!, {r4, r5, r6, pc}
.L_98:
    mov r0, #0x1
    str r0, [r4, #0xc]
    mov r0, #0x0
    str r0, [r4, #0x10]
    str r0, [r4, #0x14]
    str r0, [r4, #0x18]
    str r0, [r4, #0x1c]
    str r0, [r4, #0x20]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020beb98
