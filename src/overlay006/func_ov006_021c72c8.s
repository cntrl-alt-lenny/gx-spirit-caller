; func_ov006_021c72c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov006_021ce1c8
        .extern data_ov006_021ce1cc
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001d98
        .extern func_02005088
        .extern func_02005554
        .extern func_0202c0c0
        .extern func_0208ddec
        .extern func_02091554
        .extern func_02094504
        .extern func_020aaf10
        .global func_ov006_021c72c8
        .arm
func_ov006_021c72c8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x48
    mov r7, r0
    bl func_0208ddec
    mov r4, r0
    add r1, r4, #0xc20
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    add r0, r7, #0x4
    mov r1, #0x20
    mov r2, #0x2
    bl func_02001d0c
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    add r0, r7, #0x4
    mov r1, #0x5
    bl func_02001d98
    ldr r0, [r7, #0x54]
    cmp r0, #0x0
    beq .L_3fc
    ldr r6, [r7, #0x4c]
    ldr r2, _LIT1
    mov r0, r6, lsr #0x1f
    smull r1, r5, r2, r6
    add r5, r0, r5, asr #0x2
    cmp r5, #0x32
    blt .L_3e0
    mov r0, #0x1d0
    bl func_0202c0c0
    ldr ip, _LIT1
    mov r3, r6, lsr #0x1f
    smull r1, lr, ip, r6
    add lr, r3, lr, asr #0x2
    mov ip, #0xa
    mov r1, r0
    smull r0, r3, ip, lr
    sub lr, r6, r0
    ldr r2, _LIT2
    mov r0, r5, lsr #0x1f
    smull r6, r3, r2, r5
    add r3, r0, r3, asr #0x6
    mov r6, #0x3e8
    smull r0, r2, r6, r3
    str lr, [sp]
    sub r3, r5, r0
    ldr r2, [r7, #0x50]
    add r0, sp, #0x8
    bl func_02091554
    ldr r1, [r7, #0x4c]
    ldr r2, _LIT1
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x2
    cmp r3, #0x64
    blt .L_47c
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    ldreq r1, _LIT3
    add r0, sp, #0x8
    ldrne r1, _LIT4
    bl func_020aaf10
    b .L_47c
.L_3e0:
    ldr r0, _LIT5
    bl func_0202c0c0
    mov r1, r0
    ldr r2, [r7, #0x50]
    add r0, sp, #0x8
    bl func_02091554
    b .L_47c
.L_3fc:
    ldr r0, _LIT6
    bl func_0202c0c0
    ldr r2, [r7, #0x4c]
    ldr r5, _LIT1
    mov r1, r2, lsr #0x1f
    smull r2, r3, r5, r2
    add r3, r1, r3, asr #0x2
    ldr r6, _LIT2
    mov r1, r0
    smull r5, r2, r6, r3
    mov r0, r3, lsr #0x1f
    add r2, r0, r2, asr #0x6
    mov r5, #0x3e8
    smull r2, r0, r5, r2
    add r0, sp, #0x8
    sub r2, r3, r2
    bl func_02091554
    ldr r1, [r7, #0x4c]
    ldr r2, _LIT1
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x2
    cmp r3, #0x64
    blt .L_47c
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    ldreq r1, _LIT3
    add r0, sp, #0x8
    ldrne r1, _LIT4
    bl func_020aaf10
.L_47c:
    add r0, sp, #0x8
    mov r1, #0xc
    mov r2, #0x5
    bl func_02005554
    mov r3, r0
    mov r0, #0x3
    str r0, [sp]
    mov r5, #0xc
    add r1, sp, #0x8
    add r0, r7, #0x4
    add r2, r4, #0xc20
    rsb r3, r3, #0xf8
    str r5, [sp, #0x4]
    bl func_02005088
    add r0, r7, #0x4
    mvn r1, #0x0
    bl func_02001d98
    mov r0, #0x1
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02104f4c
_LIT1: .word 0x66666667
_LIT2: .word 0x10624dd3
_LIT3: .word data_ov006_021ce1c8
_LIT4: .word data_ov006_021ce1cc
_LIT5: .word 0x000001cf
_LIT6: .word 0x000001ce
