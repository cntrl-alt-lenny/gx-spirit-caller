; func_020643ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02061a8c
        .extern func_02061c5c
        .extern func_02061fa4
        .global func_020643ec
        .arm
func_020643ec:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r3, [r6, #0xc]
    mov r5, r1
    mov r4, r2
    cmp r3, #0x5
    bge .L_68
    ldr r1, [r6, #0x10]
    cmp r1, #0x0
    beq .L_50
    bl func_02061fa4
    mov r2, #0x0
    mov r0, r6
    mov r1, r5
    mov r3, r2
    bl func_02061c5c
    cmp r0, #0x0
    bne .L_8c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_50:
    cmp r3, #0x4
    moveq r0, #0x1
    streq r0, [r6, #0x14]
    mov r0, r6
    bl func_02061fa4
    b .L_8c
.L_68:
    cmp r3, #0x7
    beq .L_8c
    bl func_02061fa4
    mov r0, r6
    mov r1, r4
    bl func_02061a8c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_8c:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
