; func_0204969c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020436d8
        .extern func_02049734
        .extern func_020aace8
        .global func_0204969c
        .arm
func_0204969c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x100
    mov r6, r3
    add r3, sp, #0x0
    ldr r4, [sp, #0x110]
    bl func_02049734
    movs r5, r0
    mvneq r1, #0x0
    addeq sp, sp, #0x100
    streq r1, [r4]
    ldmeqia sp!, {r4, r5, r6, pc}
    add r0, sp, #0x0
    bl func_020aace8
    mov r2, #0x0
    mov r1, r0
    add r0, sp, #0x0
    mov r3, r2
    bl func_020436d8
    str r0, [r4]
    cmp r6, #0x0
    beq .L_64
    ldr r4, [r4]
    mvn r0, #0x0
    cmp r4, r0
    bne .L_70
.L_64:
    add sp, sp, #0x100
    mov r0, r5
    ldmia sp!, {r4, r5, r6, pc}
.L_70:
    add r0, sp, #0x0
    bl func_020aace8
    mov r1, r0
    add r0, sp, #0x0
    mov r2, r6
    mov r3, r4
    bl func_020436d8
    mov r0, r5
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
