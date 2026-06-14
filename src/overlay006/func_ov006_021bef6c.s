; func_ov006_021bef6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f448
        .extern func_02001d68
        .extern func_02001d98
        .extern func_02004f58
        .extern func_02005554
        .extern func_0208dd9c
        .extern func_ov006_021b6be0
        .global func_ov006_021bef6c
        .arm
func_ov006_021bef6c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, _LIT0
    mov r1, #0x2
    mov r2, #0x0
    bl func_ov006_021b6be0
    mov r6, r0
    bl func_0208dd9c
    mov r5, r0
    ldrb r0, [r6]
    bl func_02001d68
    add r0, r4, #0x4
    mov r1, #0x5
    bl func_02001d98
    add r0, r6, #0x1
    mov r1, #0xc
    mov r2, #0x5
    bl func_02005554
    ldr r1, [r4, #0x40]
    cmp r1, #0x0
    cmpne r1, #0x3
    bne .L_110
    mov r3, #0x6b
    mov r0, #0x3
    b .L_120
.L_110:
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r3, r0, #0xa5
    mov r0, #0xc
.L_120:
    str r0, [sp]
    mov ip, #0xc
    add r0, r4, #0x4
    add r1, r6, #0x1
    add r2, r5, #0x40
    str ip, [sp, #0x4]
    bl func_02004f58
    add r0, r4, #0x4
    mvn r1, #0x0
    bl func_02001d98
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov006_0224f448
