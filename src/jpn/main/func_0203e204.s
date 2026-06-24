; func_0203e204 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_0203c8b0
        .extern func_0203de5c
        .extern func_0203dea0
        .extern func_0203e050
        .extern func_0203e148
        .global func_0203e204
        .arm
func_0203e204:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r0, #0x10
    bl func_0203c8b0
    mov r4, r0
    cmp r5, #0x0
    beq .L_34
    cmp r5, #0x1
    beq .L_54
    cmp r5, #0x2
    beq .L_6c
    b .L_90
.L_34:
    add r1, r4, #0x300
    mov r0, #0x0
    mov r2, #0x144
    bl Fill32
    mov r0, r4
    bl func_0203e148
    strb r0, [r4, #0xd10]
    b .L_90
.L_54:
    bl func_0203dea0
    strb r0, [r4, #0xd10]
    mov r0, r4
    bl func_0203de5c
    strb r0, [r4, #0xd0f]
    b .L_90
.L_6c:
    add r1, r4, #0x300
    mov r0, #0x0
    mov r2, #0x144
    bl Fill32
    mov r1, #0x0
    mov r0, r4
    strb r1, [r4, #0xd0f]
    bl func_0203e050
    strb r0, [r4, #0xd10]
.L_90:
    ldrb r0, [r4, #0xd10]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
