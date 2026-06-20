; func_ov002_022427ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_0223dcc0
        .extern func_ov002_0223fd74
        .extern func_ov002_022577dc
        .extern func_ov002_022593a8
        .extern func_ov002_022593f4
        .extern func_ov002_0229cf10
        .global func_ov002_022427ec
        .arm
func_ov002_022427ec:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x100
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5b8]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_33c
    b .L_270
    b .L_2dc
    b .L_2a8
    b .L_2dc
.L_270:
    bl func_ov002_022577dc
    cmp r0, #0x2
    addlt sp, sp, #0x100
    movlt r0, #0x1
    ldmltia sp!, {r4, pc}
    add r0, sp, #0x0
    mov r1, #0xa1
    mov r2, #0x2
    bl func_ov002_0229cf10
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
.L_2a8:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022593a8
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_2dc:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_320
    ldr r1, _LIT2
    mov r0, r4
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dcc0
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_320:
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    sub r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_33c:
    mov r0, #0x1
    add sp, sp, #0x100
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word func_ov002_0223fd74
_LIT2: .word data_ov002_022d016c
