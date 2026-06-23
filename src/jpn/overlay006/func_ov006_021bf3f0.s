; func_ov006_021bf3f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov006_02255328
        .extern func_02001d48
        .extern func_02001d78
        .extern func_02004f3c
        .extern func_02005538
        .extern func_0202c06c
        .extern func_0202c3f8
        .extern func_0208dcb4
        .extern func_02094410
        .global func_ov006_021bf3f0
        .arm
func_ov006_021bf3f0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    bl func_0208dcb4
    mov r4, r0
    add r1, r4, #0x40
    mov r0, #0x0
    mov r2, #0x1000
    bl func_02094410
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    add r0, r5, #0x4
    mov r1, #0x5
    bl func_02001d78
    ldr r0, _LIT1
    ldr r0, [r0, #0x240]
    cmp r0, #0x0
    bne .L_60
    ldr r0, _LIT2
    bl func_0202c06c
    b .L_64
.L_60:
    bl func_0202c3f8
.L_64:
    mov r6, r0
    mov r0, r6
    mov r1, #0xc
    mov r2, #0x5
    bl func_02005538
    cmp r0, #0xa8
    blt .L_9c
    add r0, r5, #0x4
    mov r1, #0x4
    bl func_02001d78
    mov r0, r6
    mov r1, #0xc
    mov r2, #0x4
    bl func_02005538
.L_9c:
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    mov ip, #0xc
    str ip, [sp]
    mov r1, r6
    add r0, r5, #0x4
    add r2, r4, #0x40
    rsb r3, r3, #0xa5
    str ip, [sp, #0x4]
    bl func_02004f3c
    add r0, r5, #0x4
    mvn r1, #0x0
    bl func_02001d78
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_ov006_02255328
_LIT2: .word 0x000001cd
