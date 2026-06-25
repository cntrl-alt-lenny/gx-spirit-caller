; func_02078d54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02078d54
        .arm
func_02078d54:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r3, #0x0
    strb r3, [r0]
    strb r3, [r0, #0x1]
    add r7, r0, #0x2
.L_18:
    strb r3, [r7, r3]
    add r3, r3, #0x1
    cmp r3, #0x100
    blt .L_18
    mov r5, #0x0
    mov r6, r5
    mov r4, r5
    mov r0, r5
.L_38:
    ldrb lr, [r7, r4]
    ldrb ip, [r1, r5]
    add r3, r5, #0x1
    and r5, r3, #0xff
    add r3, lr, ip
    add r3, r6, r3
    and r6, r3, #0xff
    ldrb r3, [r7, r6]
    cmp r5, r2
    movge r5, r0
    strb r3, [r7, r4]
    add r4, r4, #0x1
    strb lr, [r7, r6]
    cmp r4, #0x100
    blt .L_38
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
