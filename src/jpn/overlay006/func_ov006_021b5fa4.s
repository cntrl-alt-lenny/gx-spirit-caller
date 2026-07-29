; func_ov006_021b5fa4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_0210596c
        .extern func_02012470
        .extern func_ov006_021b69d8
        .extern func_ov006_021b7ab0
        .extern func_ov006_021b7b94
        .extern func_ov006_021b7bc0
        .extern func_ov006_021b7bfc
        .extern func_ov006_021b7d80
        .global func_ov006_021b5fa4
        .arm
func_ov006_021b5fa4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r3, #0x0
    mov r5, r0
    mov r4, r2
    str r1, [sp]
    bl func_ov006_021b69d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_98
    b .L_44
    b .L_5c
    b .L_78
    b .L_8c
.L_44:
    add r0, r5, #0x248
    mov r2, #0x124
    mla r0, r4, r2, r0
    mov r1, r5
    bl Copy32
    b .L_98
.L_5c:
    add r0, r5, #0xb50
    add r0, r0, #0x3000
    mov r2, #0x124
    mla r0, r4, r2, r0
    mov r1, r5
    bl Copy32
    b .L_98
.L_78:
    ldr r0, _LIT0
    mov r1, r5
    mov r2, #0x124
    bl Copy32
    b .L_98
.L_8c:
    mov r0, r4
    mov r1, r5
    bl func_02012470
.L_98:
    mov r0, r5
    add r1, r5, #0x6000
    mov r2, #0x1
    str r2, [r1, #0x294]
    bl func_ov006_021b7bfc
    mov r0, r5
    bl func_ov006_021b7d80
    mov sl, #0x0
    add r0, r5, #0x6000
    mov r9, #0x1
    str sl, [r0, #0x294]
    mov r8, sl
    mvn r7, #0x0
    mov r6, r9
    mov fp, #0x2
.L_d4:
    cmp sl, #0x0
    beq .L_184
    mov r0, r5
    mov r1, sl
    mov r2, r9
    bl func_ov006_021b7b94
    mov r0, r5
    mov r1, sl
    mov r2, r8
    mov r3, r7
    bl func_ov006_021b7bc0
    mov r0, r5
    mov r1, sl
    mov r2, r6
    mov r3, r7
    bl func_ov006_021b7bc0
    mov r0, r5
    mov r1, sl
    mov r2, fp
    mov r3, r7
    bl func_ov006_021b7bc0
    mov r0, r5
    mov r1, sl
    mov r2, #0x3
    mov r3, r7
    bl func_ov006_021b7bc0
    mov r0, r5
    mov r1, sl
    mov r2, #0x4
    mov r3, r7
    bl func_ov006_021b7bc0
    mov r0, r5
    mov r1, sl
    mov r2, #0x5
    mov r3, r7
    bl func_ov006_021b7bc0
    mov r0, r5
    mov r1, sl
    mov r2, #0x6
    mov r3, r7
    bl func_ov006_021b7bc0
    mov r0, r5
    mov r1, sl
    bl func_ov006_021b7ab0
.L_184:
    add sl, sl, #0x1
    cmp sl, #0x5
    blt .L_d4
    ldr r0, [sp]
    add r1, r5, #0x6000
    str r0, [r1, #0x23c]
    str r4, [r1, #0x240]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0210596c
