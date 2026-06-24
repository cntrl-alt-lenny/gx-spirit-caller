; func_020521a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e30c
        .extern func_0204520c
        .extern func_02046804
        .extern func_02051ed4
        .extern func_02051f24
        .extern func_02052024
        .extern func_020522c0
        .extern func_020526b8
        .global func_020521a4
        .arm
func_020521a4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    mov r5, r2
    bl func_02046804
    mov r4, r0
    bl func_020522c0
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_dc
    b .L_38
    b .L_64
    b .L_78
    b .L_8c
    b .L_a0
.L_38:
    mov r0, r6
    bl func_020526b8
    cmp r0, #0x2
    ldmccia sp!, {r4, r5, r6, pc}
    cmp r0, #0x4
    ldmhiia sp!, {r4, r5, r6, pc}
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_02052024
    ldmia sp!, {r4, r5, r6, pc}
.L_64:
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_02052024
    ldmia sp!, {r4, r5, r6, pc}
.L_78:
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_02051f24
    ldmia sp!, {r4, r5, r6, pc}
.L_8c:
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_02051ed4
    ldmia sp!, {r4, r5, r6, pc}
.L_a0:
    mov r0, #0x30
    mul ip, r4, r0
    ldr r0, _LIT0
    mov r3, #0x1
    ldr r1, [r0]
    mov r2, #0x0
    add r1, r1, ip
    strb r3, [r1, #0x1d]
    ldr r1, [r0]
    add r1, r1, ip
    str r2, [r1, #0x10]
    ldr r0, [r0]
    add r0, r0, ip
    str r2, [r0, #0x18]
    ldmia sp!, {r4, r5, r6, pc}
.L_dc:
    ldr r1, _LIT1
    mov r0, #0x6
    bl func_0204520c
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219e30c
_LIT1: .word 0xfffe82b6
