; func_0203f094 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c888
        .extern func_0203c900
        .extern func_0203ee94
        .extern func_0203eee0
        .extern func_0203eefc
        .extern func_0203ef68
        .extern func_0203efa0
        .extern func_0203f030
        .extern func_02043250
        .extern func_020432d0
        .extern func_0207b5f8
        .global func_0203f094
        .arm
func_0203f094:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl func_0203c888
    mov r5, r0
    mov r0, #0x10
    bl func_0203c900
    mov r4, r0
    bl func_0207b5f8
    cmp r0, #0x9
    bne .L_240
    sub r0, r5, #0xa
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_290
    b .L_1e8
    b .L_234
    b .L_1f8
    b .L_208
    b .L_214
    b .L_224
.L_1e8:
    mov r0, r4
    bl func_0203f030
    mov r5, r0
    b .L_290
.L_1f8:
    mov r0, r4
    bl func_0203efa0
    mov r5, r0
    b .L_290
.L_208:
    bl func_0203ef68
    mov r5, r0
    b .L_290
.L_214:
    mov r0, r4
    bl func_0203eefc
    mov r5, r0
    b .L_290
.L_224:
    mov r0, r4
    bl func_0203eee0
    mov r5, r0
    b .L_290
.L_234:
    bl func_0203ee94
    mov r5, r0
    b .L_290
.L_240:
    cmp r5, #0xb
    beq .L_268
    cmp r5, #0xe
    beq .L_274
    cmp r5, #0xf
    bne .L_27c
    mov r0, r4
    bl func_0203eee0
    mov r5, r0
    b .L_290
.L_268:
    bl func_0203ee94
    mov r5, r0
    b .L_290
.L_274:
    bl func_02043250
    bl func_020432d0
.L_27c:
    ldrb r0, [r4, #0xd13]
    mov r1, #0x2
    mov r5, #0xb
    add r0, r4, r0, lsl #0x2
    strb r1, [r0, #0x444]
.L_290:
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
