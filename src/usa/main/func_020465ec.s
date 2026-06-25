; func_020465ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204f924
        .extern func_0204fa08
        .global func_020465ec
        .arm
func_020465ec:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    add r0, sp, #0x0
    bl func_0204f924
    mov r1, r0
    cmp r1, #0x0
    mov r0, #0x0
    ble .L_44
    ldr r3, [sp]
.L_28:
    ldrb r2, [r3]
    cmp r4, r2
    beq .L_44
    add r0, r0, #0x1
    cmp r0, r1
    add r3, r3, #0x1
    blt .L_28
.L_44:
    cmp r0, r1
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_0204fa08
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
