; func_ov006_021c215c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02037208
        .global func_ov006_021c215c
        .arm
func_ov006_021c215c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x60]
    ldr r1, [r4, #0x5c]
    mov r0, r0, lsl #0x2
    add r0, r0, #0x1
    add r0, r1, r0
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_5b8
    b .L_5b8
    b .L_4e4
    b .L_4f0
    b .L_4fc
    b .L_508
    b .L_530
    b .L_560
    b .L_590
.L_4e4:
    mov r0, #0x0
    str r0, [r4, #0x58]
    b .L_510
.L_4f0:
    mov r0, #0x1
    str r0, [r4, #0x58]
    b .L_510
.L_4fc:
    mov r0, #0x3
    str r0, [r4, #0x58]
    b .L_510
.L_508:
    mov r0, #0x2
    str r0, [r4, #0x58]
.L_510:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x1
    str r0, [r4, #0x6c]
    ldmia sp!, {r4, pc}
.L_530:
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x7
    str r0, [r4, #0x7c]
    mov r0, #0xe
    str r0, [r4, #0x80]
    mov r0, #0x0
    str r0, [r4, #0x84]
    b .L_5b8
.L_560:
    mov r0, #0x46
    sub r1, r0, #0x47
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x7
    str r0, [r4, #0x7c]
    mov r0, #0xf
    str r0, [r4, #0x80]
    mov r0, #0x0
    str r0, [r4, #0x84]
    b .L_5b8
.L_590:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x0
    str r0, [r4, #0x6c]
    mov r0, #0x1
    str r0, [r4, #0x50]
    ldmia sp!, {r4, pc}
.L_5b8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
