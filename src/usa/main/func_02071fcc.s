; func_02071fcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207205c
        .extern func_0207214c
        .extern func_020723e0
        .global func_02071fcc
        .arm
func_02071fcc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_020723e0
    movs r2, r0
    beq .L_6c4
    ldrb r0, [r2, #0x8]
    cmp r0, #0x1
    bne .L_678
    mov r0, r6
    mov r1, r5
    bl func_0207205c
    b .L_6b8
.L_678:
    add r0, r0, #0xfd
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_6a4
    ldr r1, [r2, #0x28]
    mov r0, r6
    sub r3, r1, #0x1
    mov r1, r5
    str r3, [r2, #0x28]
    bl func_0207205c
    b .L_6b8
.L_6a4:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    mov r3, #0x0
    bl func_0207214c
.L_6b8:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_6c4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
