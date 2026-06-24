; func_0203dbc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203dad4
        .extern func_0203db20
        .extern func_02043200
        .extern func_02043280
        .global func_0203dbc0
        .arm
func_0203dbc0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4]
    cmp r0, #0xa
    bhi .L_e8
    bl func_0203db20
    cmp r0, #0x1
    moveq r0, #0x0
    streqb r0, [r4]
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    mvn r1, #0x0
    cmp r0, r1
    bne .L_11c
    mov r0, #0x12
    strb r0, [r4]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_e8:
    cmp r0, #0xe
    bne .L_104
    bl func_02043200
    bl func_02043280
    mov r0, #0xc
    strb r0, [r4]
    b .L_11c
.L_104:
    cmp r0, #0x12
    bcs .L_11c
    bl func_0203dad4
    cmp r0, #0x1
    moveq r0, #0xa
    streqb r0, [r4]
.L_11c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
