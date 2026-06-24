; func_020819f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020819f8
        .global func_020819f8
        .arm
func_020819f8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldrsb r2, [r0, #0x4]
    ldrb ip, [r0, #0x5]
    mov r4, r1
    cmp r2, r4
    subge r1, r2, r4
    movge r5, ip, lsr r1
    strgeb r1, [r0, #0x4]
    bge .L_69c
    ldr r3, [r0]
    sub r1, r4, r2
    add r2, r3, #0x1
    str r2, [r0]
    ldrb r2, [r3]
    mov r5, ip, lsl r1
    strb r2, [r0, #0x5]
    mov r2, #0x8
    strb r2, [r0, #0x4]
    bl func_020819f8
    orr r5, r0, r5
.L_69c:
    rsb r0, r4, #0x8
    mov r1, #0xff
    and r0, r5, r1, asr r0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
