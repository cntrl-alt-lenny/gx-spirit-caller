; func_ov006_021c4bb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_021058a9
        .extern data_ov006_021cdf5c
        .extern data_ov006_0224f328
        .extern func_02001cec
        .extern func_02001d48
        .extern func_02001d78
        .extern func_02004f3c
        .extern func_02005538
        .extern func_02011b04
        .extern func_020191dc
        .extern func_0202c06c
        .extern func_0208dcb4
        .extern func_02091554
        .extern func_02094410
        .extern func_ov006_021b69d8
        .extern func_ov006_021b6ae0
        .extern func_ov006_021b6ba0
        .global func_ov006_021c4bb8
        .arm
func_ov006_021c4bb8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x48
    mov sl, r0
    ldr fp, _LIT0
    bl func_0208dcb4
    add r4, r0, #0x1440
    add r1, r4, #0x4000
    mov r0, #0x0
    mov r2, #0xc00
    bl func_02094410
    add r0, sl, #0x10
    mov r1, #0x20
    mov r2, #0x12
    bl func_02001cec
    ldr r0, [sl, #0x64]
    cmp r0, #0x0
    moveq r9, #0x0
    movne r9, #0x1
    cmp r9, #0x1
    addne sp, sp, #0x48
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, sl, r0, lsl #0x4
    ldr r6, [r0, #0xa0]
    ldr r5, [r0, #0x9c]
    mov r0, fp
    mov r1, r9
    add r2, r6, r5
    mov r3, #0x0
    bl func_ov006_021b69d8
    cmp r0, #0x0
    addeq sp, sp, #0x48
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, fp
    mov r1, r9
    add r2, r6, r5
    bl func_ov006_021b6ae0
    mov r7, r0
    mov r1, r9
    mov r0, fp
    add r2, r6, r5
    mov r9, #0x0
    bl func_ov006_021b6ba0
    mov r5, r0
    mov r6, r9
.L_b8:
    mov r0, r6
    bl func_020191dc
    bl func_02011b04
    subs r0, r0, #0x1
    bmi .L_dc
    cmp r0, r5
    moveq r8, r6
    moveq r9, #0x1
    beq .L_e8
.L_dc:
    add r6, r6, #0x1
    cmp r6, #0x60
    blt .L_b8
.L_e8:
    cmp r9, #0x0
    beq .L_1e0
    ldrb r0, [r7]
    bl func_02001d48
    add r0, sl, #0x10
    mov r1, #0x5
    bl func_02001d78
    ldr r0, _LIT1
    bl func_0202c06c
    cmp r8, #0x0
    mov r5, r0
    ldreq r6, _LIT2
    beq .L_12c
    add r0, r8, #0x178
    add r0, r0, #0x400
    bl func_0202c06c
    mov r6, r0
.L_12c:
    ldr r0, _LIT3
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_178
    ldr r1, _LIT4
    add r0, sp, #0x8
    mov r2, r5
    mov r3, r6
    bl func_02091554
    mov r3, #0x6
    add r1, sp, #0x8
    str r3, [sp]
    mov r5, #0xc
    add r0, sl, #0x10
    add r2, r4, #0x4000
    str r5, [sp, #0x4]
    bl func_02004f3c
    b .L_1d4
.L_178:
    mov r0, #0x0
    mov r1, r5
    str r0, [sp]
    mov r5, #0xc
    add r0, sl, #0x10
    add r2, r4, #0x4000
    mov r3, #0x6
    str r5, [sp, #0x4]
    bl func_02004f3c
    mov r0, r6
    mov r1, r5
    mov r2, #0x5
    bl func_02005538
    rsb r3, r0, #0xaa
    mov r5, #0xc
    cmp r3, #0x1
    str r5, [sp]
    movlt r3, #0x1
    mov r1, r6
    add r0, sl, #0x10
    add r2, r4, #0x4000
    str r5, [sp, #0x4]
    bl func_02004f3c
.L_1d4:
    add r0, sl, #0x10
    mvn r1, #0x0
    bl func_02001d78
.L_1e0:
    mov r0, #0x1
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f328
_LIT1: .word 0x0000049c
_LIT2: .word data_021058a9
_LIT3: .word data_02104e6c
_LIT4: .word data_ov006_021cdf5c
