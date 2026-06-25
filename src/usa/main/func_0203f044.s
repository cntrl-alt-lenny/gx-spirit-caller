; func_0203f044 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c838
        .extern func_0203c8b0
        .extern func_0203ee44
        .extern func_0203ee90
        .extern func_0203eeac
        .extern func_0203ef18
        .extern func_0203ef50
        .extern func_0203efe0
        .extern func_02043200
        .extern func_02043280
        .extern func_0207b510
        .global func_0203f044
        .arm
func_0203f044:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl func_0203c838
    mov r5, r0
    mov r0, #0x10
    bl func_0203c8b0
    mov r4, r0
    bl func_0207b510
    cmp r0, #0x9
    bne .L_a8
    sub r0, r5, #0xa
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_f8
    b .L_50
    b .L_9c
    b .L_60
    b .L_70
    b .L_7c
    b .L_8c
.L_50:
    mov r0, r4
    bl func_0203efe0
    mov r5, r0
    b .L_f8
.L_60:
    mov r0, r4
    bl func_0203ef50
    mov r5, r0
    b .L_f8
.L_70:
    bl func_0203ef18
    mov r5, r0
    b .L_f8
.L_7c:
    mov r0, r4
    bl func_0203eeac
    mov r5, r0
    b .L_f8
.L_8c:
    mov r0, r4
    bl func_0203ee90
    mov r5, r0
    b .L_f8
.L_9c:
    bl func_0203ee44
    mov r5, r0
    b .L_f8
.L_a8:
    cmp r5, #0xb
    beq .L_d0
    cmp r5, #0xe
    beq .L_dc
    cmp r5, #0xf
    bne .L_e4
    mov r0, r4
    bl func_0203ee90
    mov r5, r0
    b .L_f8
.L_d0:
    bl func_0203ee44
    mov r5, r0
    b .L_f8
.L_dc:
    bl func_02043200
    bl func_02043280
.L_e4:
    ldrb r0, [r4, #0xd13]
    mov r1, #0x2
    mov r5, #0xb
    add r0, r4, r0, lsl #0x2
    strb r1, [r0, #0x444]
.L_f8:
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
