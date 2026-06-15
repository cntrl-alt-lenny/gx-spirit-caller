; func_02013b4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0201b75c
        .extern func_0201b7e0
        .global func_02013b4c
        .arm
func_02013b4c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    ldr r1, [r0, #0x8d8]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0, #0x920]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    b .L_140
    b .L_14c
    b .L_168
    b .L_174
    b .L_180
    b .L_198
    b .L_1b0
    b .L_1bc
    b .L_1c8
    b .L_1d4
.L_140:
    ldr r0, _LIT0
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_14c:
    ldr r0, _LIT1
    str r0, [r4, #0x8]
    bl func_0201b75c
    ldr r1, [r0]
    bic r1, r1, #0x2000
    str r1, [r0]
    ldmia sp!, {r4, pc}
.L_168:
    ldr r0, _LIT2
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_174:
    mov r0, #0x20400
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_180:
    mov r0, r4
    bl func_0201b7e0
    cmp r0, #0x4
    ldreq r0, _LIT3
    streq r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_198:
    mov r0, r4
    bl func_0201b7e0
    cmp r0, #0x5
    ldreq r0, _LIT4
    streq r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_1b0:
    ldr r0, _LIT5
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_1bc:
    mov r0, #0x20800
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_1c8:
    ldr r0, _LIT6
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_1d4:
    ldr r0, _LIT7
    str r0, [r4, #0x8]
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00020100
_LIT1: .word 0x00020200
_LIT2: .word 0x00020300
_LIT3: .word 0x00020500
_LIT4: .word 0x00020600
_LIT5: .word 0x00020700
_LIT6: .word 0x00020900
_LIT7: .word 0x00020a00
