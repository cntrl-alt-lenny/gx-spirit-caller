; func_ov006_021c2050 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020371b8
        .global func_ov006_021c2050
        .arm
func_ov006_021c2050:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x60]
    ldr r1, [r4, #0x5c]
    mov r0, r0, lsl #0x2
    add r0, r0, #0x1
    add r0, r1, r0
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_504
    b .L_504
    b .L_430
    b .L_43c
    b .L_448
    b .L_454
    b .L_47c
    b .L_4ac
    b .L_4dc
.L_430:
    mov r0, #0x0
    str r0, [r4, #0x58]
    b .L_45c
.L_43c:
    mov r0, #0x1
    str r0, [r4, #0x58]
    b .L_45c
.L_448:
    mov r0, #0x3
    str r0, [r4, #0x58]
    b .L_45c
.L_454:
    mov r0, #0x2
    str r0, [r4, #0x58]
.L_45c:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x1
    str r0, [r4, #0x6c]
    ldmia sp!, {r4, pc}
.L_47c:
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x7
    str r0, [r4, #0x7c]
    mov r0, #0xe
    str r0, [r4, #0x80]
    mov r0, #0x0
    str r0, [r4, #0x84]
    b .L_504
.L_4ac:
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x7
    str r0, [r4, #0x7c]
    mov r0, #0xf
    str r0, [r4, #0x80]
    mov r0, #0x0
    str r0, [r4, #0x84]
    b .L_504
.L_4dc:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x0
    str r0, [r4, #0x6c]
    mov r0, #0x1
    str r0, [r4, #0x50]
    ldmia sp!, {r4, pc}
.L_504:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
