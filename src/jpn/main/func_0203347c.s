; func_0203347c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045274
        .global func_0203347c
        .arm
func_0203347c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0xe78]
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, pc}
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02045274
    movs r4, r0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    str r4, [r5, #0xe78]
    ldr r1, [sp, #0x4]
    str r1, [r5, #0xe7c]
    ldr r1, [sp]
    str r1, [r5, #0xe80]
    ldr r3, [r5, #0xebc]
    cmp r3, #0x0
    beq .L_64
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    blx r3
.L_64:
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
