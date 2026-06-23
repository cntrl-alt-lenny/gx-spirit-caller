; func_ov006_021c7004 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern func_02001cec
        .extern func_02001d48
        .extern func_02001d78
        .extern func_0200506c
        .extern func_02005538
        .extern func_0202c06c
        .extern func_0202c3f8
        .extern func_0208ddac
        .extern func_02094410
        .global func_ov006_021c7004
        .arm
func_ov006_021c7004:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    bl func_0208ddac
    mov r4, r0
    add r1, r4, #0x20
    mov r0, #0x0
    mov r2, #0xc00
    bl func_02094410
    add r0, r5, #0x4
    mov r1, #0x20
    mov r2, #0x3
    bl func_02001cec
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    add r0, r5, #0x4
    mov r1, #0x5
    bl func_02001d78
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    bne .L_184
    ldr r0, _LIT1
    bl func_0202c06c
    b .L_188
.L_184:
    bl func_0202c3f8
.L_188:
    mov r6, r0
    mov r0, r6
    mov r1, #0xc
    mov r2, #0x5
    bl func_02005538
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    mov r0, #0x6
    str r0, [sp]
    mov ip, #0xc
    mov r1, r6
    add r0, r5, #0x4
    add r2, r4, #0x20
    rsb r3, r3, #0x80
    str ip, [sp, #0x4]
    bl func_0200506c
    add r0, r5, #0x4
    mvn r1, #0x0
    bl func_02001d78
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02104e6c
_LIT1: .word 0x000001cd
